//
//  CheckboxesView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/21/23.
//

import SwiftUI

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

struct CircleCheckbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
                    .bold()
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .accessibilityLabel(Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }.buttonStyle(PlainButtonStyle())
            .padding([.leading, .trailing], 10)
    }
}

struct CheckboxesView: View {
    @State private var check2 = false
    @State private var check3 = false
    @State private var check4 = false
    @State private var doneAlert = false
    @State private var goToNext = false
    
    var body: some View {
        if goToNext { CheckboxDoneView() }
        else {
            VStack {
                Text("Check all the boxes to win!")
                    .modifier(MyTitle(size: 20))
                    .border(.purple, width: 3)
                    .background(.purple.opacity(0.5))
                
                /* checkboxes */
                VStack(alignment: .leading) {
                    Toggle("I'm already checked for you!\t", isOn: !$check4)
                        .toggleStyle(CircleCheckbox())
                        .background(Color(red: 253/255, green: 244/255, blue: 53/255, opacity: 0.3))
                    Toggle("Then me!\t\t\t\t\t", isOn: $check2)
                        .toggleStyle(CircleCheckbox())
                        .background(Color(.white).opacity(0.3))
                    Toggle("Don't forget about me!\t\t", isOn: $check3)
                        .toggleStyle(CircleCheckbox())
                        .background(Color(red: 157/255, green: 89/255, blue: 210/255, opacity: 0.3))
                    Toggle("You're almost there!\t\t\t", isOn: $check4)
                        .toggleStyle(CircleCheckbox())
                        .background(Color(red: 74/255, green: 73/255, blue: 73/255, opacity: 0.3))
                }
                
                /* next buttons */
                HStack {
                    Button("All Done!") {
                        doneAlert.toggle()
                    }.buttonStyle(MyButton(width: 80, height: 25, size: 10, opacity: 0.5))
                        .alert("No you aren't", isPresented: $doneAlert) {
                            Button("Dang", role: .cancel) {}
                        }
                    
                    Button("Give up ):") {
                        goToNext.toggle()
                    }.buttonStyle(MyButton(width: 85, height: 25, size: 10, opacity: 0.5))
                }
            }.frame(width: 600, height: 400)
                .background(Color(red: 112/255, green: 108/255, blue: 96/255))
        }
        
    }
}

struct CheckboxesView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxesView()
    }
}
