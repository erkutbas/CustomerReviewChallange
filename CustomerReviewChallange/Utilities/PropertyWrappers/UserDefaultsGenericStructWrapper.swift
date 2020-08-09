//
//  UserDefaultsGenericStructWrapper.swift
//  BitaksiClient
//
//  Created by Erkut Baş on 30.01.2020.
//  Copyright © 2020 Bitaksi. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultsGenericStructWrapper<T1: CodableDataProtocol, T2: CodableDataProtocol> {
    let key: String
    let defaultValue: T1
    let type: T2.Type

    init(_ type: T2.Type, _ key: String, defaultValue: T1) {
        self.key = key
        self.defaultValue = defaultValue
        self.type = type
    }

    var wrappedValue: T1 {
        get {
            return UserDefaults.standard.structData(T2.self, forKey: key) as? T1 ?? defaultValue
        }
        set {
            UserDefaults.standard.setStruct(newValue, forKey: key)
        }
    }
}

struct UserDefaultsGenericStructStore {
    @UserDefaultsGenericStructWrapper(TutorialStates.self, ConstantKeyStrings.TutorialKeys.hasLaunchBefore, defaultValue: .notLaunched)
    static var hasLaunchBefore: TutorialStates
}

