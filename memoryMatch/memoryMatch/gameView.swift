//
//  gameView.swift
//  memoryMatch
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct gameView: View {
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 12)
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",].shuffled()
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var gameFinished: Bool = false
    
    let columns = [
        GridItem(.fixed(120), spacing: 10, alignment: nil),
        GridItem(.fixed(120), spacing: 10, alignment: nil),
        GridItem(.fixed(120), spacing: 10, alignment: nil)
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
                        ForEach(emojis.shuffled().indices, id: \.self){ item in if cardsFlipped[item]{
                            Text(emojis[item])
                                .font(.system(size: 40))
                                .frame(width: 90, height: 90)
                                .cornerRadius(6)
                            }
                            else{
                                Text("")
                                    .font(.system(size: 40))
                                    .frame(width: 90, height: 90)
                                    .background(.blue)
                                    .cornerRadius(6)
                                    .onTapGesture {
                                        cardsFlipped[item].toggle()
                                        if pickOne == -1{
                                            pickOne = item
                                        }
                                        else if pickTwo == -1{
                                            pickTwo = item
                                            checkCards()
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func checkCards(){
        if emojis[pickOne] == emojis[pickTwo]{
            score += 1
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                cardsFlipped[pickOne] = false
                cardsFlipped[pickTwo] = false
            }
        }
    }
}


#Preview {
    gameView()
}
