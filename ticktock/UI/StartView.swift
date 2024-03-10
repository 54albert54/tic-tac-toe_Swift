//
//  StartView.swift
//  ticktock
//
//  Created by Angel alberto Bernechea on 3/9/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
       
        NavigationStack{
            Text("Tic Tac Toe").font(.title2).fontWeight(.bold).padding(.bottom, 8.0).frame(width: 300, height: 200)
           
            VStack(spacing:80){
                
                
                CustomButtonH(title: "Player vs Player") {
                               ContentView()
                           }
                           CustomButtonH(title: "Player vs CPU") {
                              PlayerVSCPU()
                           }
                
                
            }
        }
    }
}

#Preview {
    StartView()
}
struct CustomButtonH<Content>: View where Content: View {
    var title: String
    var action: () -> Content
    
    var body: some View {
        NavigationLink(destination: action()) {
            Text(title)
                .frame(width: 200, height: 30)
                .background(Color.blue)
                .border(Color.blue, width: 1)
                .cornerRadius(9)
                .foregroundColor(.white)
        }
    }
}
