//
//  GenericCellTypeProtocol.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation

protocol GenericCellTypeProtocol: GenericDataProtocol {
    
    var viewType: ViewType { get }
    
}

extension GenericCellTypeProtocol {
    func returnViewType() -> ViewType {
        return viewType
    }
}
