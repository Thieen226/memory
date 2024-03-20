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
    
    //create columns and style it
    let columns = [
        GridItem(.fixed(120), spacing: 10, alignment: nil), //make the box with fixed size and spacing between boxes
        GridItem(.fixed(120), spacing: 10, alignment: nil),
        GridItem(.fixed(120), spacing: 10, alignment: nil)
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("gameViewBackground")
                    .resizable() //resize the img to fit its container
                    .aspectRatio(contentMode: .fill) //stretch the img to fill the available space
                    .edgesIgnoringSafeArea(.all) //take all the edges of the screen and safe area
                VStack{
                    Text("Current Score: \(score)")
                        .padding()
                        .font(Font.custom("MadimiOne-Regular", size:
                                            45))
                    LazyVGrid(columns: columns, spacing: 10) { //adding columns and spacing between them
                        ForEach(emojis.shuffled().indices, id: \.self){ item in //create each card
                            if cardsFlipped[item]{ //check if the card is flipped
                            Text(emojis[item]) //display the emoji on the card
                                .font(.system(size: 40))
                                .frame(width: 90, height: 90)
                                .cornerRadius(6)
                            }
                            else{
                                Text("") // if card is not flipped, display nothing
                                    .font(.system(size: 40))
                                    .frame(width: 90, height: 90)
                                    .background(.blue)
                                    .cornerRadius(6)
                                    .onTapGesture { //if the card is clicked, do the following
                                        if pickOne == -1 || pickTwo == -1{ //only allow flipping card when pickOne or pickTwo is -1
                                            cardsFlipped[item].toggle() //change its value to true
                                            if pickOne == -1{ //if no card has not chosen
                                                pickOne = item //assign item index to make it as first pick
                                            }
                                            else{ //if no second card has not chosen
                                                pickTwo = item //assign item index as second choice
                                                checkCards(index: item) //call checkCards func to check if two cards are matching
                                            }
                                        }
                                    }
                            }
                        }
                    }
                    if score == 6{ //if score is 6, meaning the game is done
                        HStack{ //make the following elements horizontally
                            NavigationLink(destination: finishView()) { //go to finishView when Next is clicked
                                Text("Next")
                                    .font(Font.custom("MadimiOne-Regular", size: 45))
                                    .foregroundColor(.white)
                                    .frame(width: 130, height: 60)
                                    .background(.blue)
                                    .cornerRadius(6)
                            }
                            NavigationLink(destination: gameView()) { //go back to gameView when Retry is clicked
                                //the gameView will reset to a new game
                                Text("Retry")
                                    .font(Font.custom("MadimiOne-Regular", size: 45))
                                    .foregroundColor(.white)
                                    .frame(width: 130, height: 60)
                                    .background(.blue)
                                    .cornerRadius(6)
                            }
                        }
                        .padding() //add padding between the cards and Next and Retry texts
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) //hide back button
    }
    func checkCards(index : Int){
        //if two cards flipped
        if emojis[pickOne] == emojis[pickTwo]{ //check two cards are matching
            score += 1  //then add 1 to the score
            //reset variables for new attempts
            pickOne = -1
            pickTwo = -1
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ //if two cards are not matching, then flip the cards back after 0.5s
                //flip the flipped cards back
                cardsFlipped[pickOne] = false
                cardsFlipped[pickTwo] = false
                //reset variables
                pickOne = -1
                pickTwo = -1
            }
        }
    }
}


#Preview {
    gameView()
}
