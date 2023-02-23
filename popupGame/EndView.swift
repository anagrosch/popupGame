//
//  EndView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/23/23.
//

import SwiftUI

struct EndView: View {
    var body: some View {
        VStack {
            Text("Aw man, that's it?")
                .modifier(MyTitle(size: 30))
                .border(.red, width: 3)
                .background(.red.opacity(0.4))
            
            Text("Stay tuned for more rounds to come out!")
                .padding()
                .font(.system(size: 15))
        }
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
