//
//  Stereotype.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation
import SwiftData

@Model
class Recipe {
    @Attribute(.unique) var name: String
    var stereotypeQuestion: String?
//    var rolemodels : 
}
