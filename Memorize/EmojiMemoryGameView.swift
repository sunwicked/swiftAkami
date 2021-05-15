//
//  ContentView.swift
//  Memorize
//
//  Created by MindTickle on 11/05/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //everytime is called is calculated
    //legos small views combine to form views
    // generic view
   @ObservedObject var viewModel:EmojiMemoryGameViewModel
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
        
       
    }
}

struct CardView:View{
    var card:MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.red)
                }
            }.font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    // Mark ; Drawing Constraints
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor : CGFloat = 0.75
    
    func fontSize(for size:CGSize)->CGFloat{
        min(size.width,size.height) * fontScaleFactor
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        Group {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
