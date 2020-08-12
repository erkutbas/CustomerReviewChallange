//
//  TutorialCollectionViewCell.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class TutorialCollectionViewCell: BaseCollectionViewCell {
    
    lazy var tutorialImage: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFit
        return temp
    }()

    override func setupView() {
        super.setupView()
        
        backgroundColor = ColorSpectrum.appGreyBackground
    }
    
    override func addMajorViews() {
        super.addMajorViews()
        addTutorialImageView()
    }
    
    private func addTutorialImageView() {
        contentView.addSubview(tutorialImage)
        
        NSLayoutConstraint.activate([
            
            tutorialImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tutorialImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tutorialImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tutorialImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            tutorialImage.heightAnchor.constraint(equalToConstant: frame.height),
            tutorialImage.widthAnchor.constraint(equalToConstant: frame.width),
            
        ])
    }
    
    func setImages(image: UIImage) {
        tutorialImage.image = image
    }
    
}
