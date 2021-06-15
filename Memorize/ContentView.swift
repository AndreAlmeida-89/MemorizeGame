//
//  ContentView.swift
//  Memorize
//
//  Created by Andre Almeida on 13/06/21.
//

import SwiftUI

// This is the View. The View reflects the current state of the Model.
// We don't save state in the View!! It's is saved only in the Model.

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card )
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}



struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}


