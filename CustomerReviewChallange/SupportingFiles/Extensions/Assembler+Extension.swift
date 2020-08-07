//
//  Assembler+Extension.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 7.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
       
        let container = Container()
        
        let assembler = Assembler([ViewModelsAssembly()],
                                  container: container)
        return assembler
        
    }()
}
