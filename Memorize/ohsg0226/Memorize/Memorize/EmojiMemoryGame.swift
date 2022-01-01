//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 오승기 on 2021/12/14.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚅",  "🛬", "🚀", "🚤"," 🛳","⛴","🚢","🛰","💺","🛩","✈️","🚂","🚡","🚞","🚖","🚘","🛺","🏍","🚜","🚛"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}

