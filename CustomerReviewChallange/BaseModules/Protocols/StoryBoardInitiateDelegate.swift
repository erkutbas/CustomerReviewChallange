//
//  StoryBoardInitiateDelegate.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

public protocol StoryBoardInitiateDelegate {
    static var storyboard: StoryBoardIdentifiers { get }
    static func instantiate() -> Self?
}

extension StoryBoardInitiateDelegate where Self: UIViewController {
    static func instantiate() -> Self? {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: storyboard.value, bundle: nil)
        guard let viewController = uiStoryboard.instantiateViewController(withIdentifier: identifier) as? Self else { return nil }

        return viewController
    }
}
