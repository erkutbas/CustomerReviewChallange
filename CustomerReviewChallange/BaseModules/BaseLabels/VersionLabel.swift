//
//  VersionLabel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class VersionLabel: BaseDynamicStringLabel {
    
    override func prepareLabelConfigurations() {
        super.prepareLabelConfigurations()
        
        setLabelText(withData: self.data)
    }
    
    override func setupLabelSettings() {
        super.setupLabelSettings()
        textAlignment = .left
    }
    
    override func setLabelText(withData: DynamicLabelData? = nil) {
        guard let dataUnwrapped = withData else { return }
        
        self.data = withData
        
        guard let data = dataUnwrapped.data as? DynamicLabelDataProtocol else { return  }
        
        var attributedSring = NSMutableAttributedString()

        attributedSring = NSMutableAttributedString(string: "\(LabelPrompts.version.value) :\(data.returnVersion())", attributes: [NSAttributedString.Key.font : SourceSansPro.Light(fonts[0]).value!, NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedText = attributedSring
        
    }
    
}
