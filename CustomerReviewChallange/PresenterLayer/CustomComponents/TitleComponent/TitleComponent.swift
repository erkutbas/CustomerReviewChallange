//
//  TitleComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class TitleComponent: GenericBaseView<TitleComponentData> {
    
    private lazy var mainStakView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.spacing = 2
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        return temp
    }()
    
    lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.textColor = .white
        temp.contentMode = .center
        temp.textAlignment = .left
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        return temp
    }()
    
    lazy var subtitleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.textColor = .white
        temp.contentMode = .center
        temp.textAlignment = .left
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addMainStackView()
    }
    
    
    private func addMainStackView() {
        addSubview(mainStakView)
        
        NSLayoutConstraint.activate([
        
            mainStakView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStakView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStakView.topAnchor.constraint(equalTo: topAnchor),
            mainStakView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setDataIntoViews()
    }
    
    private func setDataIntoViews() {
        guard let data = returnData() else { return }
        titleLabel.text = data.title
        subtitleLabel.text = data.subTitle
        titleLabel.font = data.titleFont
        subtitleLabel.font = data.subtitleFont
        subtitleLabel.lineBreakMode = data.subTitleAlignmentData.lineBreakMode
        subtitleLabel.numberOfLines = data.subTitleAlignmentData.numberOfLines
    }
    
    func setSubTitleAlignmentData(labelAlignmentData: LabelAlignmentData) {
        subtitleLabel.lineBreakMode = labelAlignmentData.lineBreakMode
        subtitleLabel.numberOfLines = labelAlignmentData.numberOfLines
    }
    
}
