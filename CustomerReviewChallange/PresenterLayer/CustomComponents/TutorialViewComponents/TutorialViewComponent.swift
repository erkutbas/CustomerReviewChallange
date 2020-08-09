//
//  TutorialViewComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class TutorialViewComponent: GenericBaseView<TutorialViewComponentData> {

    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.isPagingEnabled = true
        
        temp.delegate = self
        temp.dataSource = self
        
        return temp
        
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addTutorialViewComponent()
    }
    
    private func addTutorialViewComponent() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func setupViews() {
        super.setupViews()
        
        registerCell()
    }
    
    private func registerCell() {
        collectionView.genericRegisterCell(TutorialCollectionViewCell.self)
    }
    
}

extension TutorialViewComponent: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCollectionViewCell.identifier, for: indexPath) as? TutorialCollectionViewCell else { fatalError() }
        
        return cell
        
    }
    
}
