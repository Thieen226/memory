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
                ZStack{
                    Image("StartViewBackground")
                    VStack(spacing: 300){
                        Text("EmojiMatch")
                            .padding()
                            .background(.orange)
                            .font(Font.custom("MadimiOne-Regular", size: 45))
                            .foregroundColor(.white)
                        
                        
                        NavigationLink(destination: gameView()) {
                            Text("Start")
                                .padding(.vertical, 10)
                                .padding(.horizontal, 22)
                                .background(.blue)
                                .foregroundColor(.white)
                                .font(Font.custom("MadimiOne-Regular", size: 45))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
    }

#Preview {
    ContentView()
}
