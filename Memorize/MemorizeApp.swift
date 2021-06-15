//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andre Almeida on 13/06/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
