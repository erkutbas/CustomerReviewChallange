//
//  RatingSelectionComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit
import RxSwift

class RatingSelectionComponent: BaseView {
    
    private let disposeBag = DisposeBag()
    
    private var starRatingSelectionSubject = PublishSubject<Int>()
    
    private lazy var starRatingComponent: StarRatingView = {
        let temp = StarRatingView(frame: .zero, starStackViewData: StarRatingViewData(starCount: 5, starSpacing: 3, imageSize: CGSize(width: 24, height: 24), filledImage: "starFilledBig", emptyImage: "starEmptyBig"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addStarRatingComponent()
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    private func addStarRatingComponent() {
        addSubview(starRatingComponent)
        
        NSLayoutConstraint.activate([
            
            starRatingComponent.centerYAnchor.constraint(equalTo: centerYAnchor),
            starRatingComponent.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
        
        starRatingComponent.listenSelectedRating { [weak self] (selectedRating) in
            self?.starRatingSelectionSubject.onNext(selectedRating)
        }.disposed(by: disposeBag)
        
    }
    
    func listenSelectedRating(completion: @escaping (Int) -> Void) -> Disposable {
        return starRatingSelectionSubject.subscribe(onNext: completion)
    }
    
}
