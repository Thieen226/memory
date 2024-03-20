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
                ZStack{ //use ZStack to overlay views on top each other
                    Image("StartViewBackground")
                    VStack(spacing: 300){ //adding space in VStack to make space between two texts
                        Text("EmojiMatch")
                            .padding()
                            .background(.orange)
                            .font(Font.custom("Shojumaru-Regular", size: 40)) //add new font
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                        NavigationLink(destination: gameView()) { //go to the gameView after the user click Start 
                            Text("Start")
                                .frame(width: 150, height: 73)
                                .background(.blue)
                                .foregroundColor(.white)
                                .font(Font.custom("MadimiOne-Regular", size: 45))
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true) //hide the back button
        }
    }

#Preview {
    ContentView()
}
