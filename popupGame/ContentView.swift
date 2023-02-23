//
//  ContentView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/19/23.
//

import SwiftUI
import CoreData

struct MyButton: ButtonStyle {
    var width: CGFloat
    var height: CGFloat
    var size: CGFloat
    var opacity: CGFloat = 1
    func makeBody(configuration: Configuration) -> some View { configuration.label
            .padding()
            .font(.system(size: size, weight: Font.Weight.bold))
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(RoundedRectangle(cornerRadius: 8).fill(.purple.opacity(opacity)))
    }
}

struct NextButton: ViewModifier {
    @State private var hover = false
    func body(content: Content) -> some View {
        content
            .padding()
            .shadow(color: .blue, radius: hover ? 5 : 0)
            .onHover { isHovered in
                hover = isHovered
            }
    }
}

struct MyTitle: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
        .font(.system(size: size))
        .bold()
        .padding()
        //.background()
    }
}

struct ContentView: View {
    @State private var hoverNoButton = false
    @State private var goToNext = false
    @State private var isShadow = false
    
    var body: some View {
        if goToNext { ButtonsDoneView() }
        else {
            VStack(alignment: .center) {
                Text("Are you stupid?")
                    .modifier(MyTitle(size: 30))
                    .frame(width: 500, height: 120, alignment: .bottom)
                    .position(x: 250, y: 70)
                
                HStack {
                    Button("Yes!") {
                        goToNext.toggle()
                    }.buttonStyle(MyButton(width: 100, height: 40, size: 15))
                        .shadow(color: .indigo, radius: isShadow ? 5 : 0)
                        .onHover { hover in
                            isShadow = hover
                        }
                    
                    Button("No") {
                        //do nothing
                    }.buttonStyle(MyButton(width: 100, height: 40, size: 15))
                        .position(x: hoverNoButton ? 200 : 50, y: hoverNoButton ? 0 : 20)
                        .onHover { isHovered in
                            hoverNoButton = isHovered
                        }
                    
                }.position(x: 100, y: 40)
                    .frame(width: 210, height: 40)
                
                HStack {
                    //empty
                }.position(x: 60, y: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 500, height: 300)
    }
}
