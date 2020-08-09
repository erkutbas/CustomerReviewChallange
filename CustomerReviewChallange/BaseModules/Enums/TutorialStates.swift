//
//  TutorialStates.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

enum TutorialStates: String, CodableDataProtocol {
    case launched = "LaunchedBefore"
    case notLaunched = "NotLaunchedBefore"
}
