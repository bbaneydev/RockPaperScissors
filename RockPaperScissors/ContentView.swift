//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Billy Baney on 7/4/24.
//

import SwiftUI

struct ContentView: View {
    static let allAnswers = ["🪨", "📜", "✂️"]
    
    @State private var computerChoice = allAnswers.shuffled()
    @State private var playerSelection = Bool.random()
    @State private var computerSelection = Int.random(in: 0...2)
    @State private var score = 0
    
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
        }
        .padding()
        
        VStack {
            Text(computerChoice[computerSelection])
                .font(.system(size: 100))
            if playerSelection == true {
                Text("Choose the winning move")
                    .foregroundStyle(.blue)
            } else {
                Text("Choose the losing move")
                    .foregroundStyle(.red)
            }
        }
        
        Spacer()
        
        HStack {
            Button {
                if computerChoice[computerSelection] == "✂️" && playerSelection == true {
                    score += 1
                    askQuestion()
                } else if computerChoice[computerSelection] == "📜" && playerSelection == false {
                    score += 1
                    askQuestion()
                }
            } label: {
                Text("Rock")
            }
            
            Button {
                if computerChoice[computerSelection] == "🪨" && playerSelection == true {
                    score += 1
                    askQuestion()
                } else if computerChoice[computerSelection] == "✂️" && playerSelection == false {
                    score += 1
                    askQuestion()
                }
            } label: {
                Text("Paper")
            }
            
            Button {
                if computerChoice[computerSelection] == "📜" && playerSelection == true {
                    score += 1
                    askQuestion()
                } else if computerChoice[computerSelection] == "🪨" && playerSelection == false {
                    score += 1
                    askQuestion()
                }
            } label: {
                Text("Scissors")
            }
        }
        Spacer()
    }
    
    func askQuestion() {
        computerChoice.shuffle()
        playerSelection.toggle()
    }
}

#Preview {
    ContentView()
}
