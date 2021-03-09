//
//  CharModel.swift
//  pruebaMarvel
//
//  Created by ruben on 08/03/2021.
//  Copyright © 2021 ruben. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var data: CharacterData
}

struct CharacterData: Decodable {
    var total: Int
    var results: [Character]
}

class Character: Decodable {
    var id: Int
    var name: String
    var description: String?
    var thumbnail: Thumbnail
}

struct Thumbnail: Decodable {
    var path: String
    var ext: String
    
    private enum CodingKeys : String, CodingKey {
        case path = "path"
        case ext = "extension"
    }
}
