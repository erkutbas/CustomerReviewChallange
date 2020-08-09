//
//  SplashScreenViewController.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class SplashScreenViewController: BaseViewController<SplashScreenViewModel> {
    
    private var welcomeLabelBottomConstraint = NSLayoutConstraint()

    lazy var imageContainer: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.image = VisualContents.sampleAppIcon.value
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    lazy var welcomeLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.font = SourceSansPro.SemiBold(20).value
        temp.text = LabelPrompts.welcomeToChallenge.value
        temp.textAlignment = .center
        temp.contentMode = .center
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addMajorFields()

        fireWelcomeLabel()
        viewModel.startSplashProcess()
    }
    
    private func addMajorFields() {
        view.addSubview(imageContainer)
        view.addSubview(welcomeLabel)
        
        welcomeLabelBottomConstraint = welcomeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30)
    
        NSLayoutConstraint.activate([
        
            imageContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: 100),
            imageContainer.widthAnchor.constraint(equalToConstant: 100),
            
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            welcomeLabelBottomConstraint
            
        ])
    }
    
    private func fireWelcomeLabel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.welcomeLabelBottomConstraint.constant = -30
            
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
    }

}
