//
//  DataModel.swift
//  AFP_Group2
//
//  Created by Dylan on 21/11/2023.
//

import Foundation

var misconceptions: [MisconceptionModel] = load("data.json")

func loadJsonDataFromFile() {
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
    loadJsonDataFromFile()
    let jsonData = """
    {
        "Misconception":"IT Careers are not creative",
        "Quote / Fact":"When I started working on Computer Science I realized how creative, social and fun it was, how you could build things and create things that people all over the world could use. If you could change technology, you could change the world.",
        "Highlight":"Computer Science",
        "Citation":"Susan Wojcicki",
        "Career":"CEO of YouTube",
        "Video file name":"video1"
    }
    """.data(using: .utf8)!
    
    
    do {
        let careerInfo = try JSONDecoder().decode(MisconceptionModel.self, from: jsonData)
//        print(careerInfo)
    } catch {
        print("Error decoding JSON: \(error)")
    }
    
    
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
