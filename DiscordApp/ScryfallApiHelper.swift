//
//  ScryfallApiHelper.swift
//  DiscordApp
//
//  Created by Zachary on 2024-03-19.
//

import Foundation
import UIKit

enum PokeAPI_Errors: Error {
    case cannotConvertURL
}

let cache = NSCache<NSString, Card>()
let imageCache = NSCache<NSString, UIImage>()


enum ScryfallAPI_Errors: Error {
    case shitsFucked
}

class ScryfallApiHelper {
    private static var baseURLString = "https://api.scryfall.com/cards/random?q=f:commander"
    
    public static func fetch() async throws -> Data {
        guard
            let url = URL(string: baseURLString)
        else { throw ScryfallAPI_Errors.shitsFucked}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
    
    public static func fetchRandomCard() async throws -> Card {
        let data = try await fetch()
        
        let decoder = JSONDecoder()
        
        let card = try decoder.decode(Card.self, from: data)
        
        return card
    }
}

