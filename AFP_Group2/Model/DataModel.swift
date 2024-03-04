//
//  DataModel.swift
//  AFP_Group2
//
//  Created by Dylan on 21/11/2023.
//

import Foundation
import UIKit
import SwiftData

var misconceptions: [MisconceptionModel] = load("data.json")
//var backgroundImporter: BackgroundImporter = try! BackgroundImporter(modelContainer: ModelContainer(for: MisconceptionModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)))



private func loadJsonDataFromFile() {
    guard let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") else {
        print("JSON file not found")
        return
    }

    do {
        let data = try Data(contentsOf: fileUrl)
        let careerInfos = try JSONDecoder().decode([MisconceptionModel].self, from: data)
        print(careerInfos)
    } catch {
        print("Error reading or decoding JSON: \(error)")
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        print("loaded")
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}

func attributedString(text: String, highlighted: String? = nil, backgroundColor: UIColor, foregroundColor: UIColor) -> AttributedString {
    var attributedString = AttributedString(text)

    if let highlighted = highlighted, !highlighted.isEmpty,
       let range = attributedString.range(of: highlighted) {
        attributedString[range].backgroundColor = backgroundColor
        attributedString[range].foregroundColor = foregroundColor
    }

    return attributedString
}

class BackgroundImporter {
    var modelContainer: ModelContainer

    init(modelContainer: ModelContainer) {
        print("init?")
        self.modelContainer = modelContainer
        backgroundInsert()
    }

    func backgroundInsert() {
        let modelContext = ModelContext(modelContainer)
        misconceptions[0].quoteBookmark = true
        
        modelContext.insert(misconceptions[0])
        
        print("inserted")
        
    }
}
