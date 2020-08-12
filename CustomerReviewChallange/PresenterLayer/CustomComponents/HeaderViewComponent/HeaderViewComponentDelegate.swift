//
//  HeaderViewComponentDelegate.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

protocol HeaderViewComponentDelegate: AnyObject {
    func getHeaderItem(index: Int) -> GenericCellTypeProtocol?
    func getNumberOfHeaderItem() -> Int
}

