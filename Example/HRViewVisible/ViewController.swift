//
//  ViewController.swift
//  HRViewVisible
//
//  Created by 1335430614@qq.com on 09/23/2024.
//  Copyright (c) 2024 1335430614@qq.com. All rights reserved.
//

import UIKit
import HRViewVisible

class ViewController: UIViewController {
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.blueView.setVisible(.gone(direction: .right))
            UIView.animate(withDuration: 0.2) {
                self.view.updateFocusIfNeeded()
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.titleView.setVisible(.gone(direction: .bottom))
                self.blueView.setVisible(.visible(direction: .right))
                UIView.animate(withDuration: 0.2) {
                    self.view.updateFocusIfNeeded()
                }
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.titleView.setVisible(.visible(direction: .bottom))
                    UIView.animate(withDuration: 0.2) {
                        self.view.updateFocusIfNeeded()
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func snapkitConstraint(_ sender: Any) {
        self.navigationController?.pushViewController(SnapKitTestViewController(), animated: true)
    }
}

