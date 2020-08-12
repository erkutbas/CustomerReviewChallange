//
//  MainViewModel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel: BaseViewModelDelegate {
    
    private let disposeBag = DisposeBag()
    
    private var reviewUsecase: ReviewUsecase!
    
    private var reviewUsecaseCallBack: ReviewUsecaseCallBack = ReviewUsecaseCallBack()
    
    private var dataLoadingState = PublishSubject<DataLoadingState>()
    
    private var feedEntryData: Array<Entry>?
    
    init(reviewUsecase: ReviewUsecase) {
        self.reviewUsecase = reviewUsecase
    }
    
    func executeReviewUsecase() {
        reviewUsecase.execute(useCaseCallBack: reviewUsecaseCallBack, params: ReviewRequest())
        reviewUsecaseCallBack.commonResult(completion: reviewCallBackListener)
    }
    
    private lazy var reviewCallBackListener: ((Result<ReviewData, ErrorResponse>) -> Void) = { [weak self] response in
     
        switch response {
        case .failure(let error):
            print("error : \(error)")
        case .success(let data):
            print("data : \(data)")
            self?.fireData(data: data)
        }
        
    }
    
    private func fireData(data: ReviewData) {
        guard let feed = data.feed, let entryData = feed.entry else { return }
        feedEntryData = entryData
        fireDataLoadingState(state: .loaded)
    }
    
    func subscribeDataLoadingState(completion: @escaping DataLoadingStateCompletion) -> Disposable {
        return dataLoadingState.subscribe(onNext: completion)
    }
    
    func fireDataLoadingState(state: DataLoadingState) {
        dataLoadingState.onNext(state)
    }
    
    func returnData(index: Int) -> FeedComponentViewData? {
        guard let data = feedEntryData else { return nil }
        return data.map { (entry) -> FeedComponentViewData in
            return FeedComponentViewData(titleComponentData: TitleComponentData(title: entry.author?.name?.label, subTitle: entry.imVersion?.label), titleComponentDetailData: TitleComponentData(title: entry.title?.label, subTitle: entry.content?.label), rating: returnInteger(data: entry.imRating?.label))
        }[index]
    }
    
    private func returnInteger(data: String?) -> Int {
        guard let data = data, let integer = Int(data) else { return 0 }
        return integer
    }
    
    func returnNumberOfItems() -> Int {
        guard let data = feedEntryData else { return 0 }
        return data.count
    }
    
    func dismissCoordinator() {

    }
    
    deinit {
        print("DEINIT MainViewModel")
    }
}
