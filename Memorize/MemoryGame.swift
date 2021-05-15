//
//  MemoryGame.swift
//  Memorize
//
//  Created by MindTickle on 11/05/21.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards :Array<Card>
    
    mutating func choose(card:Card){
        print("card chosen: \(card)")
        let chosenIndex = self.index(of:card)
        self.cards[chosenIndex].isFaceUp = !card.isFaceUp
    }
    
    func index(of card:Card)->Int{
        for index in 0..<self.cards.count{
            if(card.id == self.cards[index].id){
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairOfCards:Int, cardContentFactory:(Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards
        {
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content,id:pairIndex*2))
            cards.append(Card(content: content,id:pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
        
        
        var isFaceUp:Bool = true
        var isMatched:Bool = false
        var content:CardContent
        var id: Int
    }
}
