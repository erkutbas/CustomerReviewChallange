//
//  FilterCollectionViewCell.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class FilterCollectionView: BaseView {
    
    private var tappedCompletion: VoidOperation?
    
    lazy var filterImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFit
        temp.image = VisualContents.filterIcon.value
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addImageView()
    }
    
    override func setupViews() {
        super.setupViews()
        
        addTapGesture()
    }
    
    private func addImageView() {
        addSubview(filterImageView)
        
        NSLayoutConstraint.activate([
        
            filterImageView.heightAnchor.constraint(equalToConstant: 30),
            filterImageView.widthAnchor.constraint(equalToConstant: 30),
            
            filterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            filterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            filterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            filterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        
        ])
    }
    
}

extension FilterCollectionView: UIGestureRecognizerDelegate {
    func subscribeViewTapped(completion: @escaping VoidOperation) {
        tappedCompletion = completion
    }
    
    @objc fileprivate func actionTapped(_ sender: UITapGestureRecognizer) {
        startPressedAnimationCommon { [weak self](finish) in
            if finish {
                self?.tappedCompletion?()
            }
        }
        
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: .actionTapped)
        tapGesture.delegate = self
        addGestureRecognizer(tapGesture)
    }
}

fileprivate extension Selector {
    static let actionTapped = #selector(FilterCollectionView.actionTapped)
}
