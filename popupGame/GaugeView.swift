//
//  GaugeView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/23/23.
//
//  Asks user to guess a number with stepper and gause.
//  Trick: No correct answer, will go to next page after
//  random number of tries (between 2-8)

import SwiftUI

struct SpeedometerGaugeStyle: GaugeStyle {
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
 
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 242/255, green: 242/255, blue: 248/255))
 
            Circle()
                .trim(from: 0, to: 0.75 * configuration.value)
                .stroke(purpleGradient, lineWidth: 25)
                .rotationEffect(.degrees(135))
 
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, dash: [1, 34], dashPhase: 0.0))
                .rotationEffect(.degrees(135))
 
            VStack {
                configuration.currentValueLabel
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                Text(":)")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 250, height: 250)
    }
}

struct MyStepper: View {
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Button("- ") { if value >= 0.05 { value -= 0.05 } }
            Button(" +") { if value < 0.96 { value += 0.04 } }
        }.padding([.top, .bottom], 4)
            .padding([.leading, .trailing], 18)
            .font(.system(size: 40))
            .foregroundColor(Color(red: 192/255, green: 146/255, blue: 204/255))
            .background { RoundedRectangle(cornerRadius: 8) }
            .buttonStyle(.plain)
    }
}

/* count num of button hits & go to next page after randMax */
func checkCount(goNext: Binding<Bool>, alert: Binding<Bool>, count: Binding<Int>) {
    let randMax = Int.random(in: 2..<8)
    
    DispatchQueue.main.async {
        count.wrappedValue += 1
    }
    if count.wrappedValue >= randMax {
        goNext.wrappedValue.toggle()
    }
    else { alert.wrappedValue.toggle() }
}

struct GaugeView: View {
    @State private var gaugeLevel = 0.7
    @State private var count = 0
    @State private var alert = false
    @State private var goToNext = false
    
    var body: some View {
        if goToNext { GaugeDoneView() }
        else {
            VStack(alignment: .center) {
                Text("What number am I?")
                    .modifier(MyTitle(size: 20))
                    .border(Color(red: 192/255, green: 146/255, blue: 204/255), width: 3)
                    .background(Color(red: 192/255, green: 146/255, blue: 204/255, opacity: 0.5))
                
                Spacer()
                Gauge(value: gaugeLevel, in: 0...1) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 69))
                } currentValueLabel: {
                    Text(Int(gaugeLevel*69), format: .number)
                }.gaugeStyle(SpeedometerGaugeStyle())
                
                Spacer()
                HStack {
                    MyStepper(value: $gaugeLevel)
                    
                    Button {
                        checkCount(goNext: $goToNext, alert: $alert, count: $count)
                    } label: {
                        Image(systemName: "checkmark")
                    }.padding([.top, .bottom], 12)
                        .padding([.leading, .trailing], 18)
                        .font(.system(size: 32))
                        .foregroundColor(Color(red: 192/255, green: 146/255, blue: 204/255))
                        .background { RoundedRectangle(cornerRadius: 8) }
                        .buttonStyle(.plain)
                        .alert("You really thought you got it", isPresented: $alert) {
                            Button("You didn't!", role: .cancel) {}
                        }
                }
            }
        }
    }
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView()
    }
}
