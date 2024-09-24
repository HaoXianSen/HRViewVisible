//
//  SnapKitTestViewController.swift
//  UIView+Visibility
//
//  Created by 郝玉鸿 on 2024/9/20.
//  Copyright © 2024 neevek. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitTestViewController: UIViewController {
    
    private lazy var tag1: UILabel = getTag1Label()
    private lazy var tag2: UILabel = getTag2Label()
    private lazy var tag3: UILabel = getTag3Label()
    
    private lazy var hideButton: UIButton = getHideButton()
    private lazy var showButton: UIButton = getShowButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }
    
    private func buildUI() {
        self.view.backgroundColor = .white
        self.title = "SnapKit Test"
        self.view.addSubview(tag1)
        self.view.addSubview(tag2)
        self.view.addSubview(tag3)
        self.view.addSubview(hideButton)
        self.view.addSubview(showButton)
        
        tag1.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(14)
            make.width.equalTo(80)
            make.height.equalTo(44)
        }
        
        tag2.snp.makeConstraints { make in
            make.top.equalTo(self.tag1)
            make.left.equalTo(self.tag1.snp.right).offset(14)
            make.height.equalTo(44)
        }
        
        tag3.snp.makeConstraints { make in
            make.top.equalTo(self.tag2)
            make.left.equalTo(self.tag2.snp.right).offset(14)
            make.height.equalTo(44)
        }
        
        hideButton.snp.makeConstraints { make in
            make.top.equalTo(self.tag1.snp.bottom).offset(20)
            make.size.equalTo(CGSize(width: 80, height: 40))
            make.left.equalTo(self.tag1)
        }
        
        showButton.snp.makeConstraints { make in
            make.top.equalTo(self.hideButton)
            make.size.equalTo(CGSize(width: 80, height: 40))
            make.left.equalTo(self.hideButton.snp.right).offset(14)
        }
    }
    
    @objc
    private func hide(button: UIButton) {
        tag1.setVisible(.gone(direction: .right))
        tag2.setVisible(.gone(direction: .right))
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc
    private func show(button: UIButton) {
        tag1.setVisible(.visible(direction: .right))
        tag2.setVisible(.visible(direction: .right))
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }

    private func getTag1Label() -> UILabel {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .blue
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.text = "tag1"
        label.textColor = .white
        return label
    }
    
    private func getTag2Label() -> UILabel {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .blue
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.text = "tag2"
        label.textColor = .white
        return label
    }
    
    private func getTag3Label() -> UILabel {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .blue
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.text = "tag3"
        label.textColor = .white
        return label
    }
    
    private func getHideButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle("hide", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(hide(button:)), for: .touchUpInside)
        return button
    }
    
    private func getShowButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle("show", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(show(button:)), for: .touchUpInside)
        return button
    }
}
