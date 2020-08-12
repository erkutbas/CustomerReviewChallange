//
//  MainViewController.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: BaseViewController<MainViewModel> {
    
    override var viewTitle: String? {
        return LabelPrompts.feedList.value
    }
    
    private let disposeBag = DisposeBag()
    
    private var activityIndicator: UIActivityIndicatorView!
    
    lazy var starVersionComponent: StarVersionComponent = {
        let temp = StarVersionComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()

    private var feedComponentView: FeedComponentView!
    
    private var feedSliderComponent: FeedSliderComponent!

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addFeedSliderComponent()
        addActivityIndicator()
        
        subsribeViewModelDataLoadingProcess()
        
        // async call is too fast, let's make it slow to see, loading animation
        viewModel.fireDataLoadingState(state: .loading)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            self?.viewModel.executeReviewUsecase()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(#function)")
    }
    
    private func addFeedSliderComponent() {
        feedSliderComponent = FeedSliderComponent(frame: .zero, delegate: self)
        feedSliderComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(feedSliderComponent)
        
        NSLayoutConstraint.activate([
        
            feedSliderComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedSliderComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedSliderComponent.topAnchor.constraint(equalTo: view.topAnchor),
            feedSliderComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
        
        feedSliderComponent.listenSelectedData { [weak self](data) in
            guard let data = data as? FeedComponentViewData else { return }
            self?.viewModel.fireForDetailFlow(data: data)
        }
    }
    
    func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
        
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    func activityIndicatorManager(active: Bool) {
        active ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    private func subsribeViewModelDataLoadingProcess() {
        viewModel.subscribeDataLoadingState { [weak self](state) in
            switch state {
            case .none:
                break
            case .loaded:
                self?.activityIndicatorManager(active: false)
                self?.feedSliderComponent.reloadFeedSlider()
            case .loading:
                self?.activityIndicatorManager(active: true)
            }
        }.disposed(by: disposeBag)
    }
    
    deinit {
        print("DEINIT MainViewController")
    }
}

extension MainViewController: FeedSliderComponentDelegate {
    func getItem(index: Int) -> GenericDataProtocol? {
        return viewModel.returnData(index: index)
    }
    
    func getNumberOfItem() -> Int {
        return viewModel.returnNumberOfItems()
    }
    

}
