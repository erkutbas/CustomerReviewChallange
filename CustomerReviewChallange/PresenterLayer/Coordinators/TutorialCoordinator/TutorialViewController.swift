//
//  TutorialViewController.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class TutorialViewController: BaseViewController<TutorialViewModel>, StoryBoardInitiateDelegate {
    
    static var storyboard: StoryBoardIdentifiers {
        return .tutorial
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var bottomContainerView: UIView!
    
    private var actionButton: DynamicActionButton!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        setupCollectionViewConfigurations()
        setupPageControlConfiguratiuons()
        addActionButton()
        
    }
    
    private func setupCollectionViewConfigurations() {
        collectionView.register(TutorialCollectionViewCell.self, forCellWithReuseIdentifier: TutorialCollectionViewCell.identifier)
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func setupPageControlConfiguratiuons() {
        pageController.currentPage = 0
    }
    
    private func addActionButton() {
        actionButton = DynamicActionButton(frame: .zero, data: viewModel.returnActionButtonData())
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        bottomContainerView.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
        
            actionButton.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            actionButton.topAnchor.constraint(equalTo: pageController.bottomAnchor, constant: 20),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            actionButton.widthAnchor.constraint(equalToConstant: 200),
        
        ])
    }
    
}

// MARK: - Collection Delegates -
extension TutorialViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.returnNumberOfPageItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCollectionViewCell.identifier, for: indexPath) as? TutorialCollectionViewCell else { fatalError() }
        
        cell.setImages(image: viewModel.returnPageItem(indexPath: indexPath))
        
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

}

// MARK: - Scroll View Delegates -
extension TutorialViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = collectionView.frame.size.width
        pageController.currentPage = Int(targetContentOffset.pointee.x / pageWidth)
    }
    
}
