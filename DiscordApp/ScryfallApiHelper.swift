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
    case badCard
}

class ScryfallApiHelper {
    public static func fetch(urlString: String) async throws -> Data {
        guard
            let url = URL(string: urlString)
        else { throw ScryfallAPI_Errors.shitsFucked}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
    
    public static func fetchRandomCard() async throws -> Card {
        let data = try await fetch(urlString: UserDefaults.standard.string(forKey: "pool") ?? PoolType.commander.rawValue)
        
        let decoder = JSONDecoder()
        
        let card = try decoder.decode(Card.self, from: data)
        
        if (card.type_line.contains("Land") && card.cmc == 0)
            || (card.type_line.contains("Contraption"))
            || (card.layout.contains("meld"))
            || (card.layout.contains("token")) {
            return try await fetchRandomCard()
        }
        
        return card
    }
}

