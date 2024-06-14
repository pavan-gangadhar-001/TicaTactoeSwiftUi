//
//  ContentView.swift
//  xand0
//
//  Created by Pavan G on 13/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameState = GameState()
    var body: some View {
        let borderSize = CGFloat(5)
        Text(gameState.turnText()).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().padding()
        Spacer()
        Text(String(format: "Noughts:%d", gameState.noughtScore)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().padding()
        VStack(spacing: borderSize){
            ForEach(0...2,id:\.self){
                row in
                HStack(spacing:borderSize){
                    ForEach(0...2,id:\.self){
                        column in
                        let cell = gameState.board[row][column]
                        Text(cell.displayTile()).font(.system(size: 60)).foregroundColor(cell.tileColor()).bold().frame(maxWidth:.infinity,maxHeight:.infinity).aspectRatio(1,contentMode: .fit).background(Color.white).onTapGesture {
                            gameState.placeTile(row,column)
                        }
                    }
                }
            }
        }.background(Color.black).padding().alert(isPresented:$gameState.showAlert){
            Alert(title: Text(gameState.alertMessage),
                  dismissButton: .default(Text("Okay")){
                gameState.restBoard()
            }
            )
        }
        Text(String(format: "Crosses:%d", gameState.crossesScore)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().padding()
        Spacer()

        
    }
}

#Preview {
    ContentView()
}
