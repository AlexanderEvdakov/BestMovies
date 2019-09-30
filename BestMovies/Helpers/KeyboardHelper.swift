//
//  KeyboardHelper.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/19/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class KeyboardHelper  {
    
    static func hanldeOverlayTextFieldsBehavior(notification: Notification, view: UIView, scrollView: UIScrollView) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
}
