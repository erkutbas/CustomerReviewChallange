//
//  BaseDynamicStringLabel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class BaseDynamicStringLabel: UILabel {

    var fonts: Array<CGFloat>
    var data: DynamicLabelData?
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let temp = UIActivityIndicatorView(style: .medium)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.hidesWhenStopped = true
        return temp
    }()
    
    init(frame: CGRect, fonts: Array<CGFloat>) {
        self.fonts = fonts
        super.init(frame: frame)
        self.prepareLabelConfigurations()
        self.setupLabelSettings()
    }
    
    init(frame: CGRect, fonts: Array<CGFloat>, data: DynamicLabelData) {
        self.fonts = fonts
        self.data = data
        super.init(frame: frame)
        self.prepareLabelConfigurations()
        self.setupLabelSettings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareLabelConfigurations() {
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            ])
        
    }
    
    func setupLabelSettings() {
        self.numberOfLines = 0
        //self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.contentMode = .topLeft
        self.textAlignment = .center
        
    }
    
    func setLabelText(withData: DynamicLabelData? = nil) {}
    
}
