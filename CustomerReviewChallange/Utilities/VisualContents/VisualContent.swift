//
//  VisualContent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 9.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import UIKit

public enum VisualContents: GenericDescriptorProtocol {
    
    case sampleAppIcon
    case tutorial1
    case tutorial2
    case tutorial3
    case tutorial4
    
    typealias Value = UIImage
    
    var value: UIImage {
        switch self {
        case .sampleAppIcon:
            return UIImage(imageLiteralResourceName: "SampleIcon")
        case .tutorial1:
            return UIImage(imageLiteralResourceName: "tutorial1")
        case .tutorial2:
            return UIImage(imageLiteralResourceName: "tutorial2")
        case .tutorial3:
            return UIImage(imageLiteralResourceName: "tutorial3")
        case .tutorial4:
            return UIImage(imageLiteralResourceName: "tutorial4")
            
        }
    }
    
}
