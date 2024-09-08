//
//  Quote.swift
//  SwiftUI_MVVM_Example
//
//  Created by Юлия  on 08.09.2024.
//

import Foundation

//Все свойства константы, тк не хотим давать кому то их менять извне 
struct Quote: Decodable {
    let anime: String
    let character: String
    let quote: String
}

extension Quote {
    
    static var dummyData: [Quote] {
        
        [
            Quote(anime: "Anime 1", character: "Character 1", quote: "Random Quote 1"),
            Quote(anime: "Anime 2", character: "Character 2", quote: "Random Quote 2"),
            Quote(anime: "Anime 3", character: "Character 3", quote: "Random Quote 3"),
            Quote(anime: "Anime 4", character: "Character 4", quote: "Random Quote 4"),
            Quote(anime: "Anime 5", character: "Character 5", quote: "Random Quote 5")
        ]
    }
}
