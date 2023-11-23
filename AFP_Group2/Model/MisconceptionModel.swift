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
    
    var bubbleColor: String
    var backgroundColor: String
    var highlightColor: String
    var backgroundTextColor: String
    var highlightTextColor: String
    let videoURL: String
    
    var state: Bool = false

    enum CodingKeys: String, CodingKey {
        case misconception = "Misconception"
        case quoteOrFact = "Quote / Fact"
        case highlight = "Highlight"
        case citation = "Citation"
        case career = "Career"
        case videoFileName = "Video file name"
        case bubbleColor = "BubbleColor"
        case backgroundColor = "BackgroundColor"
        case highlightColor = "HighlightColor"
        case backgroundTextColor = "BackgroundTextColor"
        case highlightTextColor = "HighlightTextColor"
        case videoURL = "VideoLink"
    }
}

extension Color {
    static subscript(name: String) -> Color {
        switch name {
            case "blueish":
                return Color.blueish
            case "yellowish":
                return Color.yellowish
            case "redish":
                return Color.redish
            case "redishDark":
                return Color.redishDark
            case "pinkish":
                return Color.pinkish
            case "blackish":
                return Color.blackish
            case "white":
                return Color.white
            case "blueishdark":
                return Color.blueishdark // Define this color
            case "greenish":
                return Color.blueish // Define this color
            case "pinkishDark":
                return Color.pinkishDark // Define this color
            case "yellowishDark":
                return Color.yellowishDark // Define this color
            default:
                return Color.accentColor
        }
    }
}


extension UIColor {
    static subscript(name: String) -> UIColor {
        switch name {
            case "blueish":
                return UIColor.blueish
            case "yellowish":
                return UIColor.yellowish
            case "redish":
                return UIColor.redish
            case "redishDark":
                return UIColor.redishDark
            case "pinkish":
                return UIColor.pinkish
            case "blackish":
                return UIColor.blackish
            case "white":
                return UIColor.white
            case "blueishdark":
                return UIColor.blueishdark // Define this color
            case "greenish":
                return UIColor.blueish // Define this color
            case "pinkishDark":
                return UIColor.pinkishDark // Define this color
            case "yellowishDark":
                return UIColor.yellowishDark // Define this color
            default:
                return UIColor.black
        }
    }
}
