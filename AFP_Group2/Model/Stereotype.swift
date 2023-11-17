//
//  Stereotype.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation

class Stereotype {
    var id = UUID()
    var name: String
    var stereotypeQuestion: String?
    var rolemodels : [RoleModel] ?
    var quotes : [Quote] ?
}

extension Stereotype {
    static let dummyData = [
        MyDataModel(title: "Item 1", description: "Description for Item 1"),
        MyDataModel(title: "Item 2", description: "Description for Item 2"),
    ]
}
