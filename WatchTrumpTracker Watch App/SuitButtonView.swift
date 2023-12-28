//
//  SuitButtonView.swift
//  WatchTrumpTracker
//
//  Created by Chad Wallace on 12/27/23.
//

import SwiftUI
import UIKit

struct SuitButtonView: View {
    
    var thisButtonSuit: String
    var thisButtonColor: Color
    @Binding var suitType: String
    @Binding var suitColor: Color
    @Binding var showTrump: Bool
    @Binding var firstHand: Bool

    // establish a timer that can countdown every 0.3 seconds. Will use for my flashing box behind trump suit buttons.
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    @State private var newGameCounter = 2
    @State private var newGameFlashOnOff = 0
    @State private var opacity: Double = 0.0
    
    var body: some View {
        VStack{
            Button() {
                showTrump = true
                firstHand = false
                suitType = thisButtonSuit
                suitColor = thisButtonColor
                
                
            } label: {
                Image(systemName: (thisButtonSuit))
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    .foregroundColor(thisButtonColor)
                    .opacity(0.7)
                    .padding(8.0)

            } // end label
        }
    }
}

#Preview {
    SuitButtonView(thisButtonSuit:("suit.spade.fill"), thisButtonColor: Color.black, suitType: Binding.constant("suit.spade.fill"), suitColor: Binding.constant(Color.black), showTrump: Binding.constant(true), firstHand: Binding.constant(true))
}

