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

    private var feedSliderComponent: FeedSliderComponent!
    private var ratingSelectionComponent: RatingSelectionComponent!
    private var headerViewComponent: HeaderViewComponent!

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addHeaderViewComponent()
        addFeedSliderComponent()
        addActivityIndicator()
        listenFilterOperation()
        addRatingSelection()
        
        subsribeViewModelDataLoadingProcess()
        
        // async call is too fast, let's make it slow to see, loading animation
        viewModel.fireDataLoadingState(state: .loading)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            self?.viewModel.executeReviewUsecase()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) { [weak self] in
            self?.viewModel.executeReviewUsecase()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func addFeedSliderComponent() {
        feedSliderComponent = FeedSliderComponent(frame: .zero, delegate: self)
        feedSliderComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(feedSliderComponent)
        
        NSLayoutConstraint.activate([
        
            feedSliderComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedSliderComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedSliderComponent.topAnchor.constraint(equalTo: headerViewComponent.bottomAnchor, constant: 5),
            feedSliderComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
        
        feedSliderComponent.listenSelectedData { [weak self](data) in
            guard let data = data as? FeedComponentViewData else { return }
            self?.viewModel.fireForDetailFlow(data: data)
        }
    }
    
    private func addRatingSelection() {
        ratingSelectionComponent = RatingSelectionComponent()
        ratingSelectionComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(ratingSelectionComponent)
        
        ratingSelectionComponentActivationManager(active: false)

        NSLayoutConstraint.activate([
        
            ratingSelectionComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ratingSelectionComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ratingSelectionComponent.topAnchor.constraint(equalTo: view.topAnchor),
            ratingSelectionComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
        
        ratingSelectionComponent.listenSelectedRating { [weak self](selectedRating) in
            self?.ratingSelectionComponentActivationManager(active: false, animated: true)
            self?.viewModel.filterByStar(rating: selectedRating)
        }.disposed(by: disposeBag)
    }
    
    private func addHeaderViewComponent() {
        headerViewComponent =  HeaderViewComponent(frame: .zero, delegate: self)
        headerViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerViewComponent)
        
        NSLayoutConstraint.activate([
        
            headerViewComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: UIApplication.shared.returnTopPaddingHeight()),
            headerViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    private func ratingSelectionComponentActivationManager(active: Bool, animated: Bool = false) {
        if animated {
            UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
                self?.ratingSelectionComponent.alpha = active ? 1 : 0
            })
        } else {
            ratingSelectionComponent.alpha = active ? 1 : 0
        }
        
    }
    
    private func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
        
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    private func activityIndicatorManager(active: Bool) {
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
                self?.headerViewComponent.reloadHeader()
            case .loading:
                self?.activityIndicatorManager(active: true)
            }
        }.disposed(by: disposeBag)
    }
    
    private func listenFilterOperation() {
        headerViewComponent.filterView.subscribeViewTapped { [weak self] in
            self?.ratingSelectionComponentActivationManager(active: true, animated: true)
        }
    }
    
    deinit {
        print("DEINIT MainViewController")
    }
}

// Mark: - FeedSliderComponentDelegate -
extension MainViewController: FeedSliderComponentDelegate {
    
    func getItem(index: Int) -> GenericDataProtocol? {
        return viewModel.returnData(index: index)
    }
    
    func getNumberOfItem() -> Int {
        return viewModel.returnNumberOfItems()
    }
    
    func refreshData() {
        viewModel.executeReviewUsecase()
    }

}

// Mark: - HeaderViewComponentDelegate -
extension MainViewController: HeaderViewComponentDelegate {
    
    func getHeaderItem(index: Int) -> GenericCellTypeProtocol? {
        return viewModel.getOccuringData(index: index)
    }
    
    func getNumberOfHeaderItem() -> Int {
        return viewModel.getOccuringDataCount()
    }
    
}
