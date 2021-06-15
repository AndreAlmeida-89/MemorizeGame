//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andre Almeida on 14/06/21.
//

import SwiftUI

//This is the ViewModel of Emoji Memory Game. Its is responsable to interpreter the Model to the View.

class EmojiMemoryGame: ObservableObject {
    static let emojis = [ "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇", "🚊", "🚉", "🚁", "🛩", "✈️", "🛫", "🛬", "🚀", "🛰", "💺", "🛶", "⛵️", "🛥", "🚤", "🛳", "⛴", "🚢"]
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    //Swift knows how to detect changes on Structs. That's the reason the Model is a Struct.
    //With @Published before our Model, we don't neet to call objectWillChange.send() every time there's is a change.
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
