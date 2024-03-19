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
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Great Job!")
                    .font(Font.custom("MadimiOne-Regular", size: 45))
                    .foregroundColor(.black)
                    .cornerRadius(6)
                NavigationLink(destination: ContentView()) {
                    Text("Play Again")
                        .font(Font.custom("MadimiOne-Regular", size: 45))
                        .foregroundColor(.white)
                        .frame(width: 250, height: 70)
                        .background(.blue)
                        .cornerRadius(6)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    finishView()
}
