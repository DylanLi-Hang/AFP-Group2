//
//  DataModel.swift
//  AFP_Group2
//
//  Created by Dylan on 21/11/2023.
//

import Foundation

var misconceptions:[MisconceptionModel] = loadJson(filename: "data.json")!

func loadJson(filename fileName: String) -> [MisconceptionModel]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: nil) {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([MisconceptionModel].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
