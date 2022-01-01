//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 오승기 on 2021/12/05.
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
