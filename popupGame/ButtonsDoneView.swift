//
//  ButtonsTrickView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/20/23.
//
//  Transition page from ContentView to CheckboxesView

import SwiftUI

struct ButtonsDoneView: View {
    @State private var goToNext = false
    
    var body: some View {
        if goToNext { CheckboxesView() }
        else {
            VStack(alignment: .center) {
                Text("I knew it!")
                    .modifier(MyTitle(size: 30))
                    .border(.purple, width: 3)
                    .padding([.leading, .trailing], 20)
                
                Text("Hehe I got you")
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

struct ButtonsDoneView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsDoneView()
    }
}
