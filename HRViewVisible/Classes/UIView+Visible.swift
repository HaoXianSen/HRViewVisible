//
//  UIView+Visible.swift
//  HRViewVisible
//
//  Created by 郝玉鸿 on 2024/9/23.
//

import Foundation

public extension UIView {
    struct Direction: OptionSet {
        public var rawValue: Int
        
        public static let left = Direction(rawValue: 1 << 0)
        public static let right = Direction(rawValue: 1 << 1)
        public static let top = Direction(rawValue: 1 << 2)
        public static let bottom = Direction(rawValue: 1 << 3)
        public static let all: Direction = [.left, .right, .top, .bottom]
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    enum VisibleType {
        case visible(direction: Direction)
        case invisible
        case gone(direction: Direction)
    }
    
    func setVisible(_ visible: VisibleType) {
        switch visible {
        case .visible(let direction):
            guard let superview = self.superview else {
                return
            }
            if direction.contains(.left) {
                restoreConstraint(with: .left, on: superview)
                restoreConstraint(with: .leading, on: superview)
            }
            if direction.contains(.right) {
                restoreConstraint(with: .right, on: superview)
                restoreConstraint(with: .trailing, on: superview)
            }
            if direction.contains(.top) {
                restoreConstraint(with: .top, on: superview)
            }
            if direction.contains(.bottom) {
                restoreConstraint(with: .bottom, on: superview)
            }
            restoreConstraint(with: .width, on: self)
            restoreConstraint(with: .height, on: self)
        case .gone(let direction):
            guard let superview = self.superview else {
                return
            }
            if direction.contains(.left) || direction.contains(.right) {
                clearConstraint(with: .width, on: self)
                if direction.contains(.left) {
                    clearConstraint(with: .leading, on: superview)
                    clearConstraint(with: .left, on: superview)
                }
                if direction.contains(.right) {
                    clearConstraint(with: .right, on: superview)
                    clearConstraint(with: .trailing, on: superview)
                }
            }
            if direction.contains(.top) || direction.contains(.bottom) {
                clearConstraint(with: .height, on: self)
                if direction.contains(.top) {
                    clearConstraint(with: .top, on: superview)
                }
                if direction.contains(.bottom) {
                    clearConstraint(with: .bottom, on: superview)
                }
            }
        case .invisible:
            self.isHidden = true
        }
    }
    
    private func clearConstraint(with attribute: NSLayoutAttribute, on view: UIView) {
        guard let constraints = findConstraints(in: view, attribute: attribute) else {
            return
        }
        
        constraints.forEach { constraint in
            constraint.clear()
        }
    }
    
    private func restoreConstraint(with attribute: NSLayoutAttribute, on view: UIView) {
        guard let constraints = findConstraints(in: view, attribute: attribute) else {
            return
        }
        
        constraints.forEach { constraint in
            constraint.restore()
        }
    }
    
    private func findConstraints(in view: UIView, attribute: NSLayoutAttribute) -> [NSLayoutConstraint]? {
        return view.constraints.filter { constraint in
            guard let firstItem = constraint.firstItem as? NSObject else {
                return false
            }
            
            if firstItem == self && constraint.firstAttribute == attribute {
                return true
            }
            
            guard let secondItem = constraint.secondItem as? NSObject else {
                return false
            }
            
            return secondItem == self && constraint.secondAttribute == attribute
        }
    }
}

extension NSLayoutConstraint {
    private struct AssociationKey {
        static var key = 0
    }
    func clear() {
        if constant != 0 {
            objc_setAssociatedObject(self, &AssociationKey.key, NSNumber(floatLiteral: self.constant), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.constant = 0
        }
    }
    
    func restore() {
        guard let oldConstraint = objc_getAssociatedObject(self, &AssociationKey.key) as? NSNumber else {
            return
        }
        self.constant = oldConstraint.doubleValue
        objc_setAssociatedObject(self, &AssociationKey.key, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
