//
//  DynamicActionButtonData.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit
import RxSwift

public class DynamicActionButtonData {
    private(set) var title: String
    private(set) var titleColor: UIColor
    private(set) var backgroundColor: UIColor
    private(set) var titleFont: UIFont?
    private(set) var actionButtonFired: PublishSubject<Void>
    
    public init(title: String, titleColor: UIColor = ColorSpectrum.blackTextColor, backgroundColor: UIColor = ColorSpectrum.yellowColor, titleFont: UIFont? = SourceSansPro.SemiBold(14).value, actionButtonFired: PublishSubject<Void> = PublishSubject<Void>()) {
        self.title = title
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.titleFont = titleFont
        self.actionButtonFired = actionButtonFired
        
    }
}
