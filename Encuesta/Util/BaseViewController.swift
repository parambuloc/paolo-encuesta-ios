//
//  BaseViewController.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/6/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            self.keyboardWillShow(notification: notification)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (notification) in
            self.keyboardWillHide(notification: notification)
        }
    }
    
    
    @objc private func keyboardWillShow(notification:Notification){
        guard let userInfo = notification.userInfo,
            let keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
                return
        }
        
        let contentInset = UIEdgeInsets(top:0, left:0, bottom:keyboardFrame.height + 10, right:0)
        scrollView?.contentInset = contentInset
    }
    
    @objc private func keyboardWillHide(notification:Notification){
        scrollView?.contentInset = UIEdgeInsets.zero
    }
    
}
