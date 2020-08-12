//
//  StarRatingView.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class StarRatingView: UIStackView {
    
    private var ratingButtons = [UIButton]()
    private var data: StarRatingViewData!
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }

    init(frame: CGRect, starStackViewData: StarRatingViewData) {
        self.data = starStackViewData
        super.init(frame: frame)
        
        alignment = .fill
        axis = .horizontal
        distribution = .fill
        spacing = data.starSpacing

        setupButtons()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - major functions
extension StarRatingView {
    
    private func setupButtons() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: data.filledImage, in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: data.emptyImage, in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: data.filledImage, in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0 ..< data.starCount {
            let button = UIButton()
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: data.imageSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: data.imageSize.width).isActive = true
            
            button.accessibilityLabel = "Set \(index + 1) star rating"
            button.sizeToFit()

            button.addTarget(self, action: .starButtonTapped, for: .touchUpInside)
            
            addArrangedSubview(button)

            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
        
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            // Set accessibility hint and value
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    
    @objc func starButtonTapped(_ sender: UIButton) {
        guard let index = ratingButtons.firstIndex(of: sender) else {
            fatalError("The button, \(sender), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    func setStarRatingExternally(index: Int) {
        let selectedRating = index
        rating = selectedRating
    }
    
    func changeDeselectedButtonImage(imageName: String) {
        for item in arrangedSubviews {
            if let button = item as? UIButton {
                let bundle = Bundle(for: type(of: self))
                let emptyStar = UIImage(named: imageName, in: bundle, compatibleWith: self.traitCollection)
                button.setImage(emptyStar, for: .normal)
            }
        }
    }
    
}

fileprivate extension Selector {
    static let starButtonTapped = #selector(StarRatingView.starButtonTapped)
}
