//
//  UIViewController+Extensions.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import MBProgressHUD

fileprivate var aView: UIView?

extension UIViewController {
    func showSpinner() {
        DispatchQueue.main.async {
            aView = (self.parent != nil) ? UIView(frame: self.parent!.view.bounds) : UIView(frame: self.view.bounds)
            guard let containerView = aView else { return }
            containerView.backgroundColor = UIColor.clear
            MBProgressHUD.showAdded(to: containerView, animated: true)
            self.view.addSubview(containerView)
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: aView ?? self.view, animated: true)
            aView?.removeFromSuperview()
            aView = nil
        }
    }
}
