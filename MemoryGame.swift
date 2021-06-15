//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andre Almeida on 14/06/21.
//

import Foundation

//This is the Model of the game. It accepsts a generic type of card content (it can be anything: a String, an Int, an Image...)
//The model is totaly UI independent. It doesn't care about the user interface of the game.

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMachIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMachIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMachIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
//    func index(of card: Card) -> Int? {
//        for i in 0..<cards.count {
//            if cards[i].id == card.id{
//                return i
//            }
//        }
//        return nil
//    }
    
    //As we don't know what is the content's type, the initilizer have to recieve a function as a parametter that creates a instance of the content.
    //In this case it is a function that recieves a Int and returns a instance of whatever the type of CardContent is (String, Int, Image, etc...)
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            
            let content = createCardContent(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
 
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
