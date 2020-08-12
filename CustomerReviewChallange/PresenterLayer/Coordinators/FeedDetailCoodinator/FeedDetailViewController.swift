//
//  FeedDetailViewController.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class FeedDetailViewController: BaseViewController<FeedDetailViewModel> {
    
    override var viewTitle: String? {
        return LabelPrompts.feedDetail.value
    }
    
    private var feedDetailComponent: FeedDetailComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addFeedDetailComponent()
        
    }

    private func addFeedDetailComponent() {
        feedDetailComponent = FeedDetailComponent(frame: .zero, data: viewModel.returnData())
        feedDetailComponent.translatesAutoresizingMaskIntoConstraints = false
        feedDetailComponent.setTitleComponentDetailAlignments(data: LabelAlignmentData(numberOfLines: 0, lineBreakMode: .byWordWrapping))
        
        view.addSubview(feedDetailComponent)
        
        NSLayoutConstraint.activate([
            
            feedDetailComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            feedDetailComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            feedDetailComponent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            feedDetailComponent.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
    }
    
    deinit {
        print("DEINIT \(FeedDetailViewController.identifier)")
    }
}
