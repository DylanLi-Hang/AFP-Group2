//
//  Stereotype.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation
import SwiftUI

struct MisconceptionModel: Codable {
    let misconception: String
    let quoteOrFact: String
    let highlight: String?
    let citation: String
    let career: String?
    let videoFileName: String
    
    let backgroundColor: String
    let highlightColor: String
    let videoURL: String
    
    var state: Bool = false

    enum CodingKeys: String, CodingKey {
        case misconception = "Misconception"
        case quoteOrFact = "Quote / Fact"
        case highlight = "Highlight"
        case citation = "Citation"
        case career = "Career"
        case videoFileName = "Video file name"
        case backgroundColor = "BackgroundColor"
        case highlightColor = "HighlightColor"
        case videoURL = "VideoLink"
    }
}

extension Color {
    static subscript(name: String) -> Color {
        switch name {
        case ".blueish":
                return Color.blueish
            case ".yellowish":
                return Color.yellowish
            case ".redish":
                return Color.redish
            default:
                return Color.accentColor
        }
    }
}

extension UIColor {
    static subscript(name: String) -> UIColor {
        switch name {
            
            case ".blueish":
                return UIColor.blueish
            case ".yellowish":
                return UIColor.yellowish
            case ".redish":
                return UIColor.redish
            default:
                return UIColor.black
        }
    }
}
