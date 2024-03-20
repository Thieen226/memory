//
//  finishView.swift
//  memoryMatch
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct finishView: View {
    var body: some View {
        ZStack{
            Image("gameViewBackground")
                .resizable() //resize the img to fit its container
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/) //stretch the img to fill the available space
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) //take all the edges of the screen and safe area /
            VStack{
                Text("🎉")
                    .font(.system(size: 100))
                    .padding()
                Text("Great Job!")
                    .font(Font.custom("Shojumaru-Regular", size: 45))
                    .foregroundColor(.black)
                    .cornerRadius(6)
                NavigationLink(destination: ContentView()) { //go back to ContentView when the user wants to play again
                    Text("Play Again")
                        .font(Font.custom("MadimiOne-Regular", size: 45))
                        .foregroundColor(.white)
                        .frame(width: 250, height: 70)
                        .background(.blue)
                        .cornerRadius(6)
                }
            }
        }
        .navigationBarBackButtonHidden(true) //hide back button
    }
}

#Preview {
    finishView()
}
