//
//  Stereotype.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation

class StereotypeModel {
    var id = UUID()
    var name: String
    var stereotypeQuestion: String?
    
    var rolemodels : [RolemodelModel]?
    var quotes : [QuoteModel]?
    
    init(id: UUID = UUID(), name: String, stereotypeQuestion: String? = nil, rolemodels: [RolemodelModel]? = nil, quotes: [QuoteModel]? = nil) {
        self.id = id
        self.name = name
        self.stereotypeQuestion = stereotypeQuestion
        self.rolemodels = rolemodels
        self.quotes = quotes
    }
    
    
}

extension StereotypeModel {
    static let dummyData = [
        StereotypeModel(name: "ST1", stereotypeQuestion: "Why?")
    ]
}
