//
//  UITableView+Extensions.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

extension UITableView {
    
    func genericRegister<T>(_ type: T.Type) where T: BaseTableViewCell {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func genericDequeCell<T>(indexPath: IndexPath) -> T where T: BaseTableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { fatalError() }
        return cell
    }
}
