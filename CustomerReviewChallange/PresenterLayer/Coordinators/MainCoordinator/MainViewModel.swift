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
    
    // rx objects
    private var dataLoadingState = PublishSubject<DataLoadingState>()
    private var gotoFurtherCoordinators = PublishSubject<FeedComponentViewData>()
    
    private var reviewUsecase: ReviewUsecase!
    private var reviewUsecaseCallBack: ReviewUsecaseCallBack = ReviewUsecaseCallBack()
    private var feedEntryData: Array<Entry>?
    private var clientData: Array<FeedComponentViewData>?
    private var mostOccuringWords = Array<FrequentLabelCollectionViewCellData>()
    
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
            self?.handleDataProcess(data: data)
        }
        
    }
    
    private func handleDataProcess(data: ReviewData) {
        guard let feed = data.feed, let entryData = feed.entry else { return }
        feedEntryData = entryData
        createClientFeedData(data: entryData)
        findOccuringWords()
        fireDataLoadingState(state: .loaded)
        
    }
    
    private func createClientFeedData(data: Array<Entry>) {
        clientData = data.map { (entry) -> FeedComponentViewData in
            return FeedComponentViewData(titleComponentData: TitleComponentData(title: entry.author?.name?.label, subTitle: entry.imVersion?.label), titleComponentDetailData: TitleComponentData(title: entry.title?.label, subTitle: entry.content?.label), rating: returnInteger(data: entry.imRating?.label))
        }
    }
    
    private func returnInteger(data: String?) -> Int {
        guard let data = data, let integer = Int(data) else { return 0 }
        return integer
    }
    
    private func createWordArrays() -> Array<String>? {
        guard let data = feedEntryData else { return nil }
        
        var tempArray = [String]()
        
        for item in data {
            if let tempSplittedData = item.content?.label?.components(separatedBy: " ") {
                tempArray.append(contentsOf: tempSplittedData.filter( { $0.count > 3 }))
            }
        }
        
        return tempArray
        
    }
    
    func returnNumberOfItems() -> Int {
        guard let data = clientData else { return 0 }
        return data.count
    }
    
    func listenForDetailFlow(completion: @escaping (FeedComponentViewData) -> Void) -> Disposable {
        return gotoFurtherCoordinators.subscribe(onNext: completion)
    }
    
    func fireForDetailFlow(data: FeedComponentViewData) {
        gotoFurtherCoordinators.onNext(data)
    }
    
    func filterByStar(rating: Int) {
        guard let data = feedEntryData else { return }
        
        clientData = data.filter({ (entry) -> Bool in
            if entry.imRating?.label == String(rating) {
                return true
            }
            return false
        }).map { (entry) -> FeedComponentViewData in
            return FeedComponentViewData(titleComponentData: TitleComponentData(title: entry.author?.name?.label, subTitle: entry.imVersion?.label), titleComponentDetailData: TitleComponentData(title: entry.title?.label, subTitle: entry.content?.label), rating: returnInteger(data: entry.imRating?.label))
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.fireDataLoadingState(state: .loaded)
        }
        
    }
    
    func getOccuringData(index: Int) -> FrequentLabelCollectionViewCellData? {
        return mostOccuringWords[index]
    }
    
    func getOccuringDataCount() -> Int {
        return mostOccuringWords.count
    }
    
    func findOccuringWords() {
        guard let words = createWordArrays() else { return }
        mostOccuringWords.removeAll()
        
        var counts = [String: Int]()
        words.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
        
        let newData = counts.sorted { (first, second) -> Bool in
            if first.value > second.value {
                return true
            } else {
                return false
            }
        }
        
        
        for item in newData[...2] {
            mostOccuringWords.append(FrequentLabelCollectionViewCellData(text: item.key, occuring: item.value))
        }
        
    }
    
    func subscribeDataLoadingState(completion: @escaping DataLoadingStateCompletion) -> Disposable {
        return dataLoadingState.subscribe(onNext: completion)
    }
    
    func fireDataLoadingState(state: DataLoadingState) {
        dataLoadingState.onNext(state)
    }
    
    func returnData(index: Int) -> FeedComponentViewData? {
        guard let data = clientData else { return nil }
        return data[index]
    }
    
    
    func dismissCoordinator() {
        
    }
    
    deinit {
        print("DEINIT MainViewModel")
    }
}
