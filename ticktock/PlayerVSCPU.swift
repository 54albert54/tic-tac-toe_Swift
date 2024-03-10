//
//  PlayerVSCPU.swift
//  ticktock
//
//  Created by Angel alberto Bernechea on 3/9/24.
//

import SwiftUI

struct PlayerVSCPU: View {
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
                Text("Player vs CPU").font(.title2).fontWeight(.bold).padding(.bottom, 8.0)

                 Text(" \(isTurn)")
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack {
                ForEach(board.indices,id:\.self ){ rowIndex in
                    HStack{
                        ForEach(board[rowIndex].indices, id: \.self) { columnIndex in
                            Button(action: {
                                if turn <= 9  {
                                    
                                    
                                    playermove(row: rowIndex, col: columnIndex)
                                }else{
                                    noMoreMove()
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
        
        
        
        
extension PlayerVSCPU {
    func noMoreMove(){
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                resetBoard()
                showResult = false
            }
    }
    func playermove(row rowIndex:Int, col columnIndex:Int){
        
        if board[rowIndex][columnIndex] == "" {
                           board[rowIndex][columnIndex] = isTurn
                checkThreeInLine(element: isTurn)
                
            isTurn  = "⭕️"
            turn = turn + 1
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                cpuMove()
            }
        }else{
            messaje = "chose another place"
        }
    }
    func cpuMove(){
        
        let cpuchoose = (row:Int.random(in: 0...2),col:Int.random(in: 0...2))
        if  board[cpuchoose.row][cpuchoose.col] != ""{
            if turn <= 9  {
                cpuMove()
            }else{
                noMoreMove()
            }
        }else{
           
            board[cpuchoose.row][cpuchoose.col] = isTurn
            checkThreeInLine(element: isTurn)
            isTurn =  "❌"
            turn = turn + 1
        }
    }
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
           // turn = 11
            showResult = true
            
            theWinner = isTurn
            noMoreMove()
        }
        
    }
    func resetBoard(){
        theWinner = nil
        turn = 1
        isTurn = "❌"
        board = [
            ["","",""],
            ["","",""],
            ["","",""],
        ]
    }
}



#Preview {
    PlayerVSCPU()
}
