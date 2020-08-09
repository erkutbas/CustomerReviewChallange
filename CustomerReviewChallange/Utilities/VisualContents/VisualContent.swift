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
    
    typealias Value = UIImage

    var value: UIImage {
        switch self {
        case .sampleAppIcon:
            return UIImage(imageLiteralResourceName: "SampleIcon")
        }
    }
    
}
