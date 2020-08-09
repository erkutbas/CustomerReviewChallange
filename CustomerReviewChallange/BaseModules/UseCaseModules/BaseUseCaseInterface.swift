//
//  BaseUseCaseInterface.swift
//  BitaksiClient
//
//  Created by Erkut Baş on 9.03.2020.
//  Copyright © 2020 Bitaksi. All rights reserved.
//

import Foundation

protocol BaseUseCaseInterface {
    
    associatedtype Parameters
    associatedtype Responses
    
    func generateUseCase(parameter: Parameters) -> Responses?
}
