//
//  gameView.swift
//  memoryMatch
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct gameView: View {
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)

    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]

    @State private var pickOne: Int = -1

    @State private var pickTwo: Int = -1

    @State private var score: Int = 0

    @State private var gameFinished: Bool = false
    
    let columns = [
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        VStack{
            Text("Current Score \(score)")
                .padding()
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(emojis.indices, id: \.self){ item in Text("\(emojis[item])")}
            }
        }
        .navigationBarBackButtonHidden(true)
       
          
    }
    
}

#Preview {
    gameView()
}
