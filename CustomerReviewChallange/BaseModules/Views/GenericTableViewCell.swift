//
//  GenericTableViewCell.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class GenericTableViewCell<DataType, ViewType: GenericBaseView<DataType>>: BaseTableViewCell {
    
    lazy var genericView: ViewType = {
        let temp = ViewType()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        
        contentView.addSubview(genericView)
        
        NSLayoutConstraint.activate([
        
            genericView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            genericView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            genericView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            genericView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        
        
        ])
    }
    
    func setRowData(data: DataType) {
        genericView.setData(data: data)
    }
    
    func subscribeToSelectedRow(completion: @escaping GenericDataProtocolCompletion) {
        genericView.startPressedAnimationCommon { [weak self](finish) in
            if finish {
                guard let data = self?.genericView.returnData() as? GenericDataProtocol else { return }
                completion(data)
            }
        }
    }
    
}
