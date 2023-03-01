//
//  GaugeDoneView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/28/23.
//
//  Transition from GaugeView to RedButtonView

import SwiftUI

struct GaugeDoneView: View {
    @State private var goToNext = false
    
    var body: some View {
        if goToNext { EndView() }
        else {
            VStack {
                Text("Did you get the right number?")
                    .modifier(MyTitle(size: 30))
                    .padding([.leading, .trailing], 20)
                    .border(Color(red: 192/255, green: 146/255, blue: 204/255), width: 3)
                    .background(Color(red: 192/255, green: 146/255, blue: 204/255, opacity: 0.5))
                
                Text("Or were you tricked into thinking you did?")
                    .padding()
                    .font(.system(size: 15))
                
                Button("Next") {
                    goToNext.toggle()
                }.buttonStyle(DefaultButtonStyle())
                    .modifier(NextButton())
            }
        }
    }
}

struct GaugeDoneView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeDoneView()
    }
}
