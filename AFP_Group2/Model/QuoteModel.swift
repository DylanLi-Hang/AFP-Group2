//
//  Quote.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation

class QuoteModel {
    var name : String?
    var roleModel : RolemodelModel?
    var quoteContent : String
    
    init(name: String? = nil, quoteContent: String) {
        self.name = name
        self.quoteContent = quoteContent
    }
}

extension QuoteModel {
    static let quotesDummyData = [
        QuoteModel(name: "Dr. Ada Turing 1", quoteContent: "Invented a widely-used encryption algorithm."),
        QuoteModel(name: "Dr. Ada Turing 2", quoteContent: "Keynote speaker at global tech conferences."),
        QuoteModel(name: "Dr. Ada Turing 3", quoteContent: "Mentor for women in STEM programs."),
        QuoteModel(name: "Dr. Ada Turing 4", quoteContent: "Published over 20 papers on AI ethics.")
    ]
}
