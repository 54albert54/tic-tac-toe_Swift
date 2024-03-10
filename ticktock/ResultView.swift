//
//  ResultView.swift
//  ticktock
//
//  Created by Angel alberto Bernechea on 3/9/24.
//

import SwiftUI

struct ShowResultView: View {
    var theWinnerIs:String?
    var isDraw:String?
    
    var body: some View {
        VStack{
          
            
            
            if let result = theWinnerIs {
                Text("Is the winner is \(result)").font(.title2).bold()
            }else{
                Text("The game is no over stil")
            }
            
        }
    }
}

#Preview {
    ShowResultView(theWinnerIs:"prueba")
}

struct ShowDraw:View {
    var body: some View {
        Text("No have a Winner")
    }
}
