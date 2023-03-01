//
//  OrderingView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/22/23.
//
//  Asks user to determine order of unorderable list.
//  Trick: There is no order and the correct answer is
//  checking all boxes -> user can't guess order

import SwiftUI

func checkOutput(next: Binding<Bool>, alert: Binding<Bool>,
                 won: Binding<Bool>, list: [Binding<Bool>]) {
    if list.allSatisfy({ $0.wrappedValue }) {
        next.wrappedValue.toggle()
        won.wrappedValue.toggle()
    }
    else { alert.wrappedValue.toggle() }
}

struct SingleRow: View {
    var text: String
    var a: Binding<Bool>
    var b: Binding<Bool>
    var c: Binding<Bool>
    var d: Binding<Bool>
    
    var body: some View {
        HStack {
            Text(text)
                .padding([.leading, .trailing])
                .font(.system(size: 18))
            Toggle("", isOn: a)
                .padding([.leading, .trailing], 11)
            Toggle("", isOn: b)
                .padding([.leading, .trailing], 11)
            Toggle("", isOn: c)
                .padding([.leading, .trailing], 11)
            Toggle("", isOn: d)
                .padding([.leading, .trailing], 11)
        }
    }
}

struct OrderingView: View {
    @State private var a1 = false
    @State private var a2 = false
    @State private var a3 = false
    @State private var a4 = false
    @State private var b1 = false
    @State private var b2 = false
    @State private var b3 = false
    @State private var b4 = false
    @State private var c1 = false
    @State private var c2 = false
    @State private var c3 = false
    @State private var c4 = false
    @State private var d1 = false
    @State private var d2 = false
    @State private var d3 = false
    @State private var d4 = false
    @State private var alert = false
    @State private var won = false
    @State private var goToNext = false
    
    var body: some View {
        if goToNext && won {
            OrderingDoneView(titleText: "You got it!", subtitleText: "Still gotta wait to move on though :P")
        }
        else if goToNext && !won {
            OrderingDoneView(titleText: "You didn't get it, huh?", subtitleText: "Now you gotta wait to move on :P")
        }
        else {
            VStack(alignment: .center) {
                Text("Can you figure out the order?")
                    .modifier(MyTitle(size: 30))
                
                VStack(alignment: .trailing) {
                    HStack {
                        Text("1")
                            .padding([.leading, .trailing, .top])
                            .font(.system(size: 15))
                        Text("2")
                            .padding([.leading, .trailing, .top])
                            .font(.system(size: 15))
                        Text("3")
                            .padding([.leading, .trailing, .top])
                            .font(.system(size: 15))
                        Text("4")
                            .padding([.leading, .trailing, .top])
                            .font(.system(size: 15))
                    }.padding(.leading, 145)
                    
                    SingleRow(text: "Call for a refill         ", a: $a1, b: $b1, c: $c1, d: $d1)
                        .background(.black.opacity(0.3))
                    SingleRow(text: "Take a walk             ", a: $a2, b: $b2, c: $c2, d: $d2)
                        .background(Color(red: 153/255, green: 153/255, blue: 153/255))
                    SingleRow(text: "Zoom zoom            ", a: $a3, b: $b3, c: $c3, d: $d3)
                        .background(.white.opacity(0.3))
                    SingleRow(text: "Admit you're dumb", a: $a4, b: $b4, c: $c4, d: $d4)
                        .background(Color(red: 128/255, green: 0/255, blue: 179/255, opacity: 0.3))
                }.padding(.bottom)
                
                HStack {
                    Button("Got it...maybe?") {
                        checkOutput(next: $goToNext, alert: $alert,
                                    won: $won,
                                    list: [$a1,$a2,$a3,$a4,$b1,$b2,$b3,$b4,
                                           $c1,$c2,$c3,$c4,$d1,$d2,$d3,$d4])
                    }.buttonStyle(MyButton(width: 150, height: 25, size: 10, opacity: 0.5))
                        .alert("That's not it, huh?", isPresented: $alert) {
                            Button("Try again", role: .cancel) {}
                        }
                    
                    Button("No bueno") {
                        goToNext.toggle()
                    }.buttonStyle(MyButton(width: 100, height: 25, size: 10, opacity: 0.5))
                }
            }
        }
    }
}

struct OrderingView_Previews: PreviewProvider {
    static var previews: some View {
        OrderingView()
    }
}
