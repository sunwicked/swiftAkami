//
//  ContentView.swift
//  Memorize
//
//  Created by MindTickle on 11/05/21.
//

import SwiftUI

struct ContentView: View {
    //everytime is called is calculated
    //legos small views combine to form views
    // generic view
    var viewModel:EmojiMemoryGame
    var body: some View {
         HStack {
            ForEach(viewModel.cards){ card in
                CardView(card:card).onTapGesture {
                    viewModel.chooseCard(card: card)
                }
            }
        }
        .padding()
         .foregroundColor(Color.orange)
        .font(Font.largeTitle)
       
    }
}

struct CardView:View{
    var card:MemoryGame<String>.Card
    
    var body: some View {
    ZStack {
        if card.isFaceUp{
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            Text(card.content)
        } else{
            RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
        }
   }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
        }
    }
}
