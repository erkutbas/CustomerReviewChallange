//
//  UIColor+Extension.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(redVal: CGFloat, greenVal: CGFloat, blueVal: CGFloat, alphaVal: CGFloat) {
        self.init(red: redVal/255, green: greenVal/255, blue: blueVal/255, alpha: alphaVal)
    }
    
}
