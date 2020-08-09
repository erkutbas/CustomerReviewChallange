//
//  InteractivePopGestureDelegate.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

protocol InteractivePopGestureDelegate: class {
    var initialInteractivePopGestureRecognizerDelegate: UIGestureRecognizerDelegate? { get set }
}

extension InteractivePopGestureDelegate where Self: UIViewController {
    func setInitialInteractivePopGestureRecognizerDelegate() {
        initialInteractivePopGestureRecognizerDelegate = self.navigationController?.interactivePopGestureRecognizer?.delegate
    }
    
    func assignInteractivePopGestureToNavigationController() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = initialInteractivePopGestureRecognizerDelegate
    }
    
    func resetInteractivePopGestureForNavigationController() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
