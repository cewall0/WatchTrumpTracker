//
//  ContentView.swift
//  WatchTrumpTracker Watch App
//
//  Created by Chad Wallace on 12/27/23.
//

import SwiftUI
import Foundation

struct ScaleButtonStyle : ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    } // end func some View
} // end struct ScaleButtonStyle


struct MainView: View {
    
    //*********************
    // Variables here
    //*********************
    
    //**** The images for the trump suits ****
    
    let spade = "suit.spade.fill"
    let diamond = "suit.diamond.fill"
    let club = "suit.club.fill"
    let heart = "suit.heart.fill"
    
    //**** The color for the trump suit for the trump suits ****
    
    @State var suit: String = "suit.club.fill"
    @State var suitColor: Color = Color.black
    
    // **** Two state variables to control the team scores ****
    @State var team1Score = 0
    @State var team2Score = 0
    @State var team1Name = "US"
    @State var team2Name = "THEM"
    
    // **** State variable to control the plus/minus buttons popping up ****
    @State var minusButtonsOn = false
    
    // **** State variable to control if the trump suit needs selected ****
    @State var showTrump = false
    
    // **** State variable to control if a score can be added ****
    @State var canAddScore = false
    
    // **** State variable to control if the game has just begun ****
    @State var firstHand = true
    
    // **** State variable to control if a score can be added ****
    @State var gameOver = false
    
    
    //*********************
    // End variables
    //*********************
    
    var body: some View {
        
        ZStack{ // needed to place background behind the other stacks.
            Image("background-cloth") // the background for the app
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
            
            HStack{ // the buttons for the various suits
                
                
                Spacer()
                
                
                SuitButtonView(thisButtonSuit: club, thisButtonColor: Color(.black), suitType: $suit, suitColor: $suitColor, showTrump: $showTrump,  firstHand: $firstHand)
                    .buttonStyle(ScaleButtonStyle())
                
                
                Spacer()
                
                
                SuitButtonView(thisButtonSuit: heart, thisButtonColor: Color(.red), suitType: $suit, suitColor: $suitColor, showTrump: $showTrump,  firstHand: $firstHand)
                    .buttonStyle(ScaleButtonStyle())
                
                
                Spacer()
                
            }
            
            VStack {
                VStack{
                    Image(systemName: suit)
                        .resizable()
//                        .ignoresSafeArea()
                        .padding(10.0)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(suitColor)
                        .opacity(0.8)
                    
                    Text("Current Trump")
                        .padding(.bottom, -2.0)
                        .font(.footnote)
                        .foregroundColor(Color("AccentColor 1"))
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
               
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    SuitButtonView(thisButtonSuit: diamond, thisButtonColor: Color(.red), suitType: $suit, suitColor: $suitColor, showTrump: $showTrump,  firstHand: $firstHand)
                        .buttonStyle(ScaleButtonStyle())
                    
                    
                    Spacer()
                    
                    SuitButtonView(thisButtonSuit: spade, thisButtonColor: Color(.black), suitType: $suit, suitColor: $suitColor, showTrump: $showTrump,  firstHand: $firstHand)
                        .buttonStyle(ScaleButtonStyle())
                    
                    Spacer()
                    
                    
                } // end HStack for various suits
            }
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    MainView()
}
