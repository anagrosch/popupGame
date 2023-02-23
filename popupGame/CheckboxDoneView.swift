//
//  CheckboxDoneView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/22/23.
//

import SwiftUI

struct CheckboxDoneView: View {
    @State private var goToNext = false
    
    var body: some View {
        if goToNext { OrderingView() }
        else {
            VStack(alignment: .center) {
                Text("Dang you almost had it")
                    .modifier(MyTitle(size: 20))
                    .border(.purple, width: 3)
                    .background(.purple.opacity(0.5))
                
                Text("Too bad you failed :(")
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

struct CheckboxDoneView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxDoneView()
    }
}
