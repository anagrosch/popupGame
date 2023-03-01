//
//  RedButtonView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/28/23.
//
//  Shows user 2 buttons
//  Trick: Both buttons say user picked wrong button

import SwiftUI

struct RedButtonView: View {
    @State private var goRed = false
    @State private var goGreen = false
    
    var body: some View {
        if goRed {
            RedButtonDoneView(subtitleText: "You just do what buttons tell you to do?\nWow")
        } else if goGreen {
            RedButtonDoneView(subtitleText: "The button told you not to hit it. You need reading lessons.")
        } else {
            VStack(alignment: .center) {
                Button {
                    goRed.toggle()
                } label: {
                    Image("red_button")
                        .resizable()
                        .frame(width: 350, height: 350)
                }.buttonStyle(.plain)
                
                Button {
                    goGreen.toggle()
                } label: {
                    Image("green_button")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .position(x: 500)
                }.buttonStyle(.plain)
            }
        }
    }
}

struct RedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RedButtonView()
    }
}
