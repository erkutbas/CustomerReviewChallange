//
//  FeedDetailViewModel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class FeedDetailViewModel: BaseViewModelDelegate {
    
    private let data: FeedComponentViewData
    
    private var dismissFeedCoordinator = PublishSubject<Void>()
    
    init(data: FeedComponentViewData) {
        self.data = data
    }
    
    func subscribeCloseFeedDetailObservable(completion: @escaping OnDismissed) -> Disposable {
        return dismissFeedCoordinator.subscribe(onNext: completion)
    }
    
    func returnData() -> FeedComponentViewData {
        return data
    }

    func dismissCoordinator() {
        dismissFeedCoordinator.onNext(())
    }
    
    deinit {
        print("DEINIT FeedDetailViewModel")
    }
    
}
