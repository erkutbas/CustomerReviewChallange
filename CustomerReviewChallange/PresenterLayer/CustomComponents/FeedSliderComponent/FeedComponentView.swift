//
//  FeedComponentView.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class FeedComponentView: GenericBaseView<GenericDataProtocol> {
    
    private lazy var mainStakView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [titleComponent, titleComponentDetail])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.spacing = 20
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var titleComponent: HeadTitleComponent = {
        let temp = HeadTitleComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    private lazy var titleComponentDetail: TailTitleComponent = {
        let temp = TailTitleComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    private lazy var starRatingComponent: StarRatingView = {
        let temp = StarRatingView(frame: .zero, starStackViewData: StarRatingViewData(starCount: 5, starSpacing: 3, imageSize: CGSize(width: 24, height: 24), filledImage: "starFilledBig", emptyImage: "starEmptyBig"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        
        setupViewConfigurations()
    }
    
    private func setupViewConfigurations() {
        backgroundColor = ColorSpectrum.cellBackground
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.6
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        addMainStackView()
        addStarRatingComponent()
    }
    
    private func addMainStackView() {
        
        addSubview(mainStakView)
        
        NSLayoutConstraint.activate([
        
            mainStakView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStakView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStakView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            //mainStakView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    private func addStarRatingComponent() {
        addSubview(starRatingComponent)
        
        NSLayoutConstraint.activate([
        
            starRatingComponent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            starRatingComponent.topAnchor.constraint(equalTo: mainStakView.bottomAnchor, constant: 20),
            starRatingComponent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setDataIntoViews()
    }
    
    private func setDataIntoViews() {
        guard let data = returnData() as? FeedComponentViewData else { return }
        titleComponent.setData(data: data.titleComponentData)
        titleComponentDetail.setData(data: data.titleComponentDetailData)
        starRatingComponent.setStarRatingExternally(index: data.rating)
    }
    
    
}
