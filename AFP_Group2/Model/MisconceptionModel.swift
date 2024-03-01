//
//  Stereotype.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class MisconceptionModel: Decodable {
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
    var videoBookmark: Bool = false
    var quoteBookmark: Bool = false

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
    
    init(misconception: String, quoteOrFact: String, highlight: String?, citation: String, career: String?, videoFileName: String, bubbleColor: String, backgroundColor: String, highlightColor: String, backgroundTextColor: String, highlightTextColor: String, videoURL: String, state: Bool) {
        self.misconception = misconception
        self.quoteOrFact = quoteOrFact
        self.highlight = highlight
        self.citation = citation
        self.career = career
        self.videoFileName = videoFileName
        self.bubbleColor = bubbleColor
        self.backgroundColor = backgroundColor
        self.highlightColor = highlightColor
        self.backgroundTextColor = backgroundTextColor
        self.highlightTextColor = highlightTextColor
        self.videoURL = videoURL
        self.state = state
    }
    
    required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.misconception = try container.decode(String.self, forKey: .misconception)
            self.quoteOrFact = try container.decode(String.self, forKey: .quoteOrFact)
            self.highlight = try container.decodeIfPresent(String.self, forKey: .highlight)
            self.citation = try container.decode(String.self, forKey: .citation)
            self.career = try container.decodeIfPresent(String.self, forKey: .career)
            self.videoFileName = try container.decode(String.self, forKey: .videoFileName)
            self.bubbleColor = try container.decode(String.self, forKey: .bubbleColor)
            self.backgroundColor = try container.decode(String.self, forKey: .backgroundColor)
            self.highlightColor = try container.decode(String.self, forKey: .highlightColor)
            self.backgroundTextColor = try container.decode(String.self, forKey: .backgroundTextColor)
            self.highlightTextColor = try container.decode(String.self, forKey: .highlightTextColor)
            self.videoURL = try container.decode(String.self, forKey: .videoURL)
            self.state = false
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
