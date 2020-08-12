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
    
    private func addView() {
        view.addSubview(starVersionComponent)
        
        NSLayoutConstraint.activate([
        
            starVersionComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            starVersionComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            starVersionComponent.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        ])
        
        starVersionComponent.setData(data: StarVersionComponentData(rating: 4))
    }
    
    private func addView2() {
        feedComponentView = FeedComponentView()
        feedComponentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(feedComponentView)
        
        NSLayoutConstraint.activate([
        
            feedComponentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            feedComponentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            feedComponentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            feedComponentView.heightAnchor.constraint(equalToConstant: 400),
        
        ])
        
        feedComponentView.setData(data: FeedComponentViewData(titleComponentData: TitleComponentData(title: "Erkut Bas", subTitle: "20.01.01"), titleComponentDetailData: TitleComponentData(title: "Laga Luga", subTitle: "When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me. When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me."), rating: 4))
        
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
            print("data : \(data.titleComponentDetailData.title)")
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
