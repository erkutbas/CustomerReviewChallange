//
//  BaseViewController.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<T: BaseViewModelDelegate>: UIViewController, InteractivePopGestureDelegate {
    
    var initialInteractivePopGestureRecognizerDelegate: UIGestureRecognizerDelegate?

    var viewModel: T!
    
    convenience init(viewModel: T) {
        self.init()
        self.viewModel = viewModel
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#function)")
        setInitialInteractivePopGestureRecognizerDelegate()
        prepareViewControllerConfigurations()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        print("\(#function)")
        super.viewWillAppear(animated)
        resetInteractivePopGestureForNavigationController()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function)")
        assignInteractivePopGestureToNavigationController()
    }
    
    open override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            viewModel.dismissCoordinator()
        }
    }
    
    open func prepareViewControllerConfigurations() {}
    
    public static var identifier: String {
        return String(describing: self)
    }
    
}
