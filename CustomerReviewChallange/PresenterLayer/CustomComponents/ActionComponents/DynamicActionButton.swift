//
//  DynamicActionButton.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class DynamicActionButton: GenericBaseView<DynamicActionButtonData> {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.layer.shadowColor = ColorSpectrum.blackTextColor.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 3)
        temp.layer.shadowRadius = 6
        temp.layer.shadowOpacity = 0.8
        return temp
    }()
    
    lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .center
        temp.textAlignment = .center
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addViewProperties()
    }
    
    override func setupViews() {
        super.setupViews()
        
        addTapGesture()
    }
    
    private func addViewProperties() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        containerView.backgroundColor = data.backgroundColor
        titleLabel.text = data.title
        titleLabel.textColor = data.titleColor
        titleLabel.font = data.titleFont
    }
    
}

// Mark: UIGestureRecognizerDelegate
extension DynamicActionButton: UIGestureRecognizerDelegate {
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .actionButtonTapped)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func actionButtonTapped(_ sender: UITapGestureRecognizer) {
        startPressedAnimationCommon { [weak self](finish) in
            if finish {
                guard let data = self?.returnData() else { return }
                data.actionButtonFired.onNext(())
            }
        }
    }
    
}

fileprivate extension Selector {
    static let actionButtonTapped = #selector(DynamicActionButton.actionButtonTapped)
}
