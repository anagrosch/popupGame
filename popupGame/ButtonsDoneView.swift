//
//  ButtonsTrickView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/20/23.
//

import SwiftUI

struct ButtonsDoneView: View {
    @State private var goToNext = false
    
    var body: some View {
        if goToNext { CheckboxesView() }
        else {
            VStack(alignment: .center) {
                Text("I knew it!")
                    .modifier(MyTitle(size: 30))
                    .frame(width: 500, height: 190, alignment: .bottom)
                    .position(x: 250, y: 70)
                
                Text("Hehe I got you")
                    .padding()
                    .font(.system(size: 15))
                    .frame(width: 500, height: 100, alignment: .top)
                
                Spacer()
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
