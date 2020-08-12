//
//  UIApplication+Extension.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 13.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

extension UIApplication {
    func returnTopPaddingHeight() -> CGFloat {
        if #available(iOS 11, *) {
            if let window = keyWindow {
                return window.safeAreaInsets.top
            }
        }
        
        return 0
    }
    
    func returnBottomPaddingHeight() -> CGFloat {
        if #available(iOS 11, *) {
            if let window = keyWindow {
                return window.safeAreaInsets.bottom
            }
        }
        
        return 0
    }
}
