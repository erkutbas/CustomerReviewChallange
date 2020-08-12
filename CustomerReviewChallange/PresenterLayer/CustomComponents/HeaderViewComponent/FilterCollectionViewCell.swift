//
//  FilterCollectionViewCell.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class FilterCollectionView: BaseCollectionViewCell {
    
    lazy var filterImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFit
        temp.image = VisualContents.filterIcon.value
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        
        addImageView()
    }
    
    private func addImageView() {
        contentView.addSubview(filterImageView)
        
        NSLayoutConstraint.activate([
        
            filterImageView.heightAnchor.constraint(equalToConstant: 50),
            filterImageView.widthAnchor.constraint(equalToConstant: 50),
            
            filterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        ])
    }
    
}
