//
//  NetworkConnectionManager.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class NetworkConnectionManager {
    
    private let disposeBag = DisposeBag()
    
    private let manager = NetworkReachabilityManager()
    
    private let networkManagerSubject = PublishSubject<NetworkReachabilityManager.NetworkReachabilityStatus>()
    
    var didNetworkReachabilityChanges: Observable<NetworkReachabilityManager.NetworkReachabilityStatus> {
        return networkManagerSubject.asObservable()
    }
    
    init() {
        guard let manager = manager else { return }
        manager.startListening { [weak self] (networkStatus) in
            self?.networkManagerSubject.onNext(networkStatus)
        }
    }
    
}
