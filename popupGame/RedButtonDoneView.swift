//
//  RedButtonDoneView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/28/23.
//
//  Transition from RedButtonView to EndView

import SwiftUI

struct RedButtonDoneView: View {
    @State private var goToNext = false
    var subtitleText: String = ""
    
    var body: some View {
        if goToNext { GaugeView() }
        else {
            VStack(alignment: .center) {
                Text("INCORRECT")
                    .modifier(MyTitle(size: 30))
                    .border(.red, width: 3)
                
                Text(subtitleText)
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

struct RedButtonDoneView_Previews: PreviewProvider {
    static var previews: some View {
        RedButtonDoneView()
    }
}
