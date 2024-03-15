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
        GridItem(.fixed(120), spacing: nil, alignment: nil),
        GridItem(.fixed(120), spacing: nil, alignment: nil),
        GridItem(.fixed(120), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("gameViewBackground")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("Current Score: \(score)")
                        .padding()
                        .font(Font.custom("MadimiOne-Regular", size:
                                         45))
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(emojis.indices, id: \.self){ item in Text(emojis[item])}
                            .font(.system(size: 40))
                            .frame(width: 90, height: 90)
                            .background(.blue)
                            .cornerRadius(6)
                            .onTapGesture {
                                
                            }
                        }
                    }
                }
            }
        .navigationBarBackButtonHidden(true)
            
        }
        
    
    
//    struct manageCards: View {
//        
//    }
    
}

#Preview {
    gameView()
}
