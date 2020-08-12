//
//  StarVersionComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class StarVersionComponent: GenericBaseView<StarVersionComponentData> {

    private lazy var mainStakView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [starRatingComponent, versionLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.spacing = 2
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .horizontal
        return temp
    }()
    
    private lazy var starRatingComponent: StarRatingView = {
        let temp = StarRatingView(frame: .zero, starStackViewData: StarRatingViewData(starCount: 5, starSpacing: 3, imageSize: CGSize(width: 10, height: 10), filledImage: "starFilledBig", emptyImage: "starEmptyBig"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    private lazy var versionLabel: VersionLabel = {
        let temp = VersionLabel(frame: .zero, fonts: [12])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
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
        starRatingComponent.setStarRatingExternally(index: data.rating)
    }
    

}
