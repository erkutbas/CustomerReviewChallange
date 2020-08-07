//
//  UserDefaultsWrapper.swift
//  BitaksiClient
//
//  Created by Erkut Baş on 30.01.2020.
//  Copyright © 2020 Bitaksi. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultWrapper<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsStore {
    @UserDefaultWrapper("has_launch_before", defaultValue: false)
    static var hasLaunchBefore: Bool
}

