//
//  Card.swift
//  DiscordApp
//
//  Created by Zachary on 2024-03-19.
//

import Foundation

class Card: Codable {
    var name: String
    var id: String
    var type_line: String
    var cmc: Double
    var layout: String
    var image_uris: [String: String]?
    var card_faces: [Card_Face]?
}

class Card_Face: Codable{
    var image_uris: [String: String]
}
