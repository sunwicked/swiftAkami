//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by MindTickle on 11/05/21.
//

import SwiftUI

class EmojiMemoryGame{
    
    
    func createCardContentFactory(pairIndex:Int)->String{
        return "😂"
    }
    
    private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func  createMemoryGame() -> MemoryGame<String>{
        let emojis = ["😂","👻","👀"]
        return  MemoryGame<String>(numberOfPairOfCards: emojis.count){ pairIndex in
        return emojis[pairIndex]}
    }
      
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards.shuffled()
    }
    
    func chooseCard(card:MemoryGame<String>.Card){
        model.choose(card:card)
    }
}
