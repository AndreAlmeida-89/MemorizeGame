//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andre Almeida on 14/06/21.
//

import Foundation

//This is the Model of the game. It accepsts a generic type of card content (it can be anything: a String, an Int, an Image...)
//The model is totaly UI independent. It doesn't care about the user interface of the game.

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        
    }
    
    //As we don't know what is the content's type, the initilizer have to recieve a function as a parametter that creates a instance of the content.
    //In this case it is a function that recieves a Int and returns a instance of whatever the type of CardContent is (String, Int, Image, etc...)
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            
            let content = createCardContent(pairIndex)
            
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
