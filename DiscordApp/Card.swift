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
    var image_uris: [String: String]
}