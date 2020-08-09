//
//  TutorialViewModel.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 8.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit
import RxSwift

class TutorialViewModel: BaseViewModelDelegate {
    
    private var actionButtonData = TutorialCoordinatorStaticData.actionButtonData
    
    func dismissCoordinator() {
    }
    
    func returnNumberOfPageItems() -> Int {
        return TutorialCoordinatorStaticData.tutorialViewData.count
    }
    
    func returnPageItem(indexPath: IndexPath) -> UIImage {
        return TutorialCoordinatorStaticData.tutorialViewData[indexPath.row]
    }
    
    func returnActionButtonData() -> DynamicActionButtonData {
        return actionButtonData
    }
    
    func subscribeActionButtonForNextAction(completion: @escaping OnDismissed) -> Disposable {
        return actionButtonData.actionButtonFired.subscribe(onNext: completion)
    }

}
