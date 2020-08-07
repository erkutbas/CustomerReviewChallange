//
//  CommonTypealises.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

// MARK: - On Dismiss Closures -
typealias OnDismissed = (() -> Void)
typealias OnCompletedBool = ((Bool) -> Void)

// MARK: - Void Operation Closures -
typealias VoidOperation = (() -> Void)

// MARK: - Button Tapped Closures -
typealias ButtonPressed = ((Bool) -> Void)

// MARK: - Camera Dragging Closures -
typealias CameraDragObverver = ((Bool) -> Void)

// MARK: - Authentication Closures -
typealias UserLoggedOut = (() -> Void)

// MARK: - Server Side Closures -
typealias SocketConnection = ((Bool) -> Void)

// MARK: - Switch Button Closures -
typealias SwitchButtonChanged  = ((Bool) -> Void)

// MARK: - TextField Closures -
typealias TextFieldChangeCompletionHandler  = ((String) -> Void)
typealias TextFieldFocusCompletionHandler = ((Bool) -> Void)

// MARK: - IndexPath Closures -
typealias SelectedIndexPath = ((IndexPath) -> Void)

// MARK: - Animation Closures -
typealias AnimationStateCompletion = ((AnimationStates) -> Void)

