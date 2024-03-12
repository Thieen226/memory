//
//  ContentView.swift
//  memoryMatch
//
//  Created by StudentAM on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            NavigationView{
                ZStack {
                    Image("StartViewBackground")
                    VStack{
                        Text("EmojiMatch")
                            .padding()
                            .background(.green)
                       
                        NavigationLink(destination: gameView()) {
                            Text("Start")
                                .padding()
                                .background(.blue)
                                .foregroundColor(.white)
                        }
                    }
            }
        }
    }
}

struct GameView: View{
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)

    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]

    @State private var pickOne: Int = -1

    @State private var pickTwo: Int = -1

    @State private var score: Int = 0

    @State private var gameFinished: Bool = false
    
    var body: some View{
        VStack{
            
        }
    }
}
#Preview {
    ContentView()
}
