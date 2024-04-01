//
//  PoolType.swift
//  DiscordApp
//
//  Created by Zachary on 2024-04-01.
//

import Foundation

enum PoolType: String{
    case commander = "https://api.scryfall.com/cards/random?q=f:commander"
    case vintage = "https://api.scryfall.com/cards/random?q=f:vintage"
    case legacy = "https://api.scryfall.com/cards/random?q=f:legacy"
    case modern = "https://api.scryfall.com/cards/random?q=f:modern"
    case pioneer = "https://api.scryfall.com/cards/random?q=f:pioneer"
    case standard = "https://api.scryfall.com/cards/random?q=f:standard"
    case vanilla = "https://api.scryfall.com/cards/random?q=is:vanilla"
    case funny = "https://api.scryfall.com/cards/random?q=is:funny"
    case chaos = "https://api.scryfall.com/cards/random"
    
}
