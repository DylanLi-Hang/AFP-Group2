//
//  Stereotype.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation

struct MisconceptionModel: Codable {
    let misconception: String
    let quoteOrFact: String
    let highlight: String?
    let citation: String
    let career: String?
    let videoFileName: String

    enum CodingKeys: String, CodingKey {
        case misconception = "Misconception"
        case quoteOrFact = "Quote / Fact"
        case highlight = "Highlight"
        case citation = "Citation"
        case career = "Career"
        case videoFileName = "Video file name"
    }
}
