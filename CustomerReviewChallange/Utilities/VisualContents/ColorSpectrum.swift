//
//  ColorSpectrum.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

public struct ColorSpectrum {
    
    public static var yellowColor: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "YellowColor") {
                return color
            }
        }
        return UIColor(redVal: 255, greenVal: 197, blueVal: 0, alphaVal: 1)
    }
    
    public static var blackTextColor: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "BlackTextColor") {
                return color
            }
        }
        return UIColor(redVal: 30, greenVal: 27, blueVal: 35, alphaVal: 1)
    }
    
    public static var appGreyBackground: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "AppGreyBackground") {
                return color
            }
        }
        return UIColor(redVal: 30, greenVal: 27, blueVal: 35, alphaVal: 1)
    }
    
    public static var cellBackground: UIColor {
        if #available(iOS 11, *) {
            if let color = UIColor(named: "CellBackground") {
                return color
            }
        }
        return UIColor(redVal: 53, greenVal: 58, blueVal: 80, alphaVal: 1)
    }
    
}
