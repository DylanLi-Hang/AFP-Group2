//
//  ViewModel.swift
//  AFP_Group2
//
//  Created by Manuela Penuela on 21/11/2023.
//

import Foundation

struct QuoteData: Decodable {
    var message: String
    var messageColor: String
}

class QuoteViewModel: ObservableObject {
    @Published var quoteData: QuoteData?

    init() {
        loadQuoteData()
    }

    func loadQuoteData() {
        // Load and parse JSON data
        // This is a simplified example. In a real app, you'd fetch this data asynchronously
        let sampleJson = """
        {
            "message": "Inspirational Quote",
            "messageColor": "blue"
        }
        """

        if let data = sampleJson.data(using: .utf8) {
            do {
                self.quoteData = try JSONDecoder().decode(QuoteData.self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
