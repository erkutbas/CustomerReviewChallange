//
//  FrequentLabelCollectionViewCell.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class FrequentLabelCollectionViewCell: BaseCollectionViewCell {
    
    lazy var infoLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = SourceSansPro.SemiBold(16).value
        temp.textColor = .white
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        
        addImageView()
    }
    
    override func setupView() {
        super.setupView()
        
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowRadius = 6
        contentView.layer.shadowOpacity = 0.6
        contentView.backgroundColor = ColorSpectrum.cellBackground
    }
    
    private func addImageView() {
        contentView.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
        
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        
        ])
    }
    
    func setData(data: GenericDataProtocol) {
        guard let data = data as? FrequentLabelCollectionViewCellData else { return }
        infoLabel.text = "\"\(data.text)\" occurs \(data.occuring) times"
    }
    
}
