//
//  ContentView.swift
//  ticktock
//
//  Created by Angel alberto Bernechea on 3/8/24.
//

import SwiftUI
// icons ❌ ⭕️

struct ContentView: View {
    @State var isTurn = "❌"
    @State var turn = 1
    @State var showResult = false
    @State var theWinner:String?
  
    
    @State var board = [
        ["","",""],
        ["","",""],
        ["","",""],
    ]
    @State var messaje = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Player vs Player").font(.title2).fontWeight(.bold).padding(.bottom, 8.0)
                turn <= 9 ?  Text("Turn of \(isTurn)") : Text(messaje)
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack {
                ForEach(board.indices,id:\.self ){ rowIndex in
                    HStack{
                        ForEach(board[rowIndex].indices, id: \.self) { columnIndex in
                            Button(action: {
                                if turn <= 9  {
                                    if board[rowIndex][columnIndex] == "" {
                                        turn = turn + 1
                                        if turn > 9{
                                            messaje = "No more move"
                                            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                                                
                                                resetBoard()
                                            }
                                        }
                                      
                                            board[rowIndex][columnIndex] = isTurn
                                            checkThreeInLine(element: isTurn)
                                            isTurn = turn % 2 == 0 ? "⭕️" : "❌"
                                       
                                    }else{
                                        messaje = "chose another place"
                                    }
                                   
                                }
                            }) {
                                Text(board[rowIndex][columnIndex])
                                
                                    .frame(width: 100, height: 100)
                                    .border(Color.primary, width: 1)
                            }.padding(.horizontal, 6.0)
                        }
                    }
                }
            }
            .sheet(isPresented: $showResult, content: {
                ShowResultView(theWinnerIs: theWinner)
            })
           
            Button {
                showResult = true
            } label: {
                Text("Result")
                    .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
            }
            
            
            Button {
                resetBoard()
            } label: {
                Text("Reset")
                    .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
    
}
        
        #Preview {
            ContentView()
        }
        
        
extension ContentView {
    func checkThreeInLine(element: String)  {
        
        // horizontal
        if  board[0][0] == element && board[0][1] == element && board[0][2] == element ||
            board[1][0] == element && board[1][1] == element && board[1][2] == element ||
            board[2][0] == element && board[2][1] == element && board[2][2] == element ||
            //verticals
            board[0][0] == element && board[1][0] == element && board[2][0] == element ||
            board[0][1] == element && board[1][1] == element && board[2][1] == element ||
            board[0][2] == element && board[1][2] == element && board[2][2] == element ||
            // X
            board[0][0] == element && board[1][1] == element && board[2][2] == element ||
            board[0][2] == element && board[1][1] == element && board[2][0] == element {
            
            turn = 10
            showResult = true
            theWinner = isTurn
        }
    }
    func resetBoard(){
        theWinner = nil
        showResult = false
        turn = 1
        isTurn = "❌"
        board = [
            ["","",""],
            ["","",""],
            ["","",""],
        ]
    }
}

