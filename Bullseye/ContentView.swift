//
//  ContentView.swift
//  Bullseye
//
//  Created by Jamie Craane on 09/12/2019.
//  Copyright © 2019 Jamie Craane. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var totalScore = 0
    @State var currentRound = 1
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                HStack {
                    Text("Put the bullseye as close as you can to:")
                    Text("\(self.target)")
                }
                Spacer()
                
                HStack {
                    Text("1")
                    Slider(value: self.$sliderValue, in: 1...100)
                    Text("100")
                }
                Spacer()
                
                Button(action: {
                    print("Button pressed!")
                    self.alertIsVisible = true
                }) {
                    Text("Hit Me!")
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    let roundedValue = Int(self.sliderValue.rounded())
                    let scoreThisRound = self.pointsForCurrentRound()
                    return Alert(title: Text("Hello there"), message: Text("The sliders value is \(sliderValueRounded()).\n" + "You scored \(self.pointsForCurrentRound()) points this round"), dismissButton: .default(Text("Awesome")) {
                            let scoreThisRound = self.pointsForCurrentRound()
                            self.totalScore += scoreThisRound
                            self.target = Int.random(in: 1...100)
                        self.currentRound += 1
                        })
                }
                Spacer()
                
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Start over")
                    }
                    Spacer()
                    Text("Score:")
                    Text("\(totalScore)")
                    Spacer()
                    Text("Round:")
                    Text("\(currentRound)")
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Info")
                    }
                }.padding(.bottom, 20)
            }
        }
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        return 100 - abs(target - sliderValueRounded())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
