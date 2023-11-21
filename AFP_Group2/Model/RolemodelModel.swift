//
//  RoleModel.swift
//  AFP_Group2
//
//  Created by Dylan on 17/11/2023.
//

import Foundation
import UIKit

class RolemodelModel {
    var name : String
    var img : UIImage?
    var careerIntro : String?
    var factsAbout : String?
    var introduction : String?
    
    init(name: String, img: UIImage? = nil, careerIntro: String? = nil, factsAbout: String? = nil, introduction: String? = nil) {
        self.name = name
        self.img = img
        self.careerIntro = careerIntro
        self.factsAbout = factsAbout
        self.introduction = introduction
    }
}

extension RolemodelModel {
    static let roleModelDummyData = [
        RolemodelModel(
            name: "Dr. Ada Turing",
            careerIntro: "Dr. Ada Turing is a renowned computer scientist and software engineer, celebrated for her groundbreaking contributions to artificial intelligence and data security. With a PhD in Computer Science from MIT, she has led numerous high-impact projects at leading tech companies and has been a vocal advocate for diversity in technology.",
            factsAbout: "A",
            introduction: "Dr. Ada Turing, a visionary in the tech world, blends profound technical expertise with a passion for ethical AI. Her journey from a young coding enthusiast to a leading figure in the IT industry is a source of inspiration. Her advocacy for inclusivity in tech and her innovative approaches to AI have earned her numerous accolades and a global following."
        )
    ]
}
