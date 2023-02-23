//
//  OrderingDoneView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/22/23.
//

import SwiftUI

/* rotating silhouette */
struct rotate: GeometryEffect {
    @Binding var cardinalDirection: String
    var angle: Double
    var animatableData: Double {
        get { angle }
        set { angle = newValue}
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.cardinalDirection = self.angleToString(self.angle)
        }
        let rotation = CGAffineTransform(rotationAngle: CGFloat(angle * (Double.pi / 180.0)))
        let offset1 = CGAffineTransform(translationX: size.width/2.0, y: size.height/2.0)
        let offset2 = CGAffineTransform(translationX: -size.width/2.0, y: -size.height/2.0)
        return ProjectionTransform(offset2.concatenating(rotation).concatenating(offset1))
    }
    
    func angleToString(_ a: Double) -> String {
        switch a {
        case 315..<405:
            fallthrough
        case 0..<45:
            return "North"
        case 45..<135:
            return "East"
        case 135..<225:
            return "South"
        default:
            return "West"
        }
    }
}

struct WaitText: ViewModifier {
    var appear: Binding<Bool>
    func body(content: Content) -> some View {
        content
        if appear.wrappedValue {
            Text("Just keep waiting, just keep waiting, just keep \nwaiting, waiting, waiting...")
                .multilineTextAlignment(.center)
        }
    }
}

struct OrderingDoneView: View {
    @State private var flag = false
    @State private var cardinalDirection = ""
    @State private var count: Int = 0
    @State private var waiting = false
    @State private var goToNext = false
    var titleText: String = ""
    var subtitleText: String = ""
    
    var body: some View {
        if goToNext { EndView() }
        else {
            VStack(alignment: .center) {
                Text(titleText)
                    .modifier(MyTitle(size: 30))
                    .border(.green, width: 3)
                
                Text(subtitleText)
                    .padding()
                    .font(.system(size: 15))
                
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .modifier(rotate(cardinalDirection: self.$cardinalDirection, angle: self.flag ? 0 : 360))
                
                Button("Next") {
                    withAnimation(.easeInOut(duration: 3.0)) {
                        self.flag.toggle()
                    }
                    checkCount(goNext: $goToNext, alert: $waiting)
                }.buttonStyle(DefaultButtonStyle())
                    .modifier(NextButton())
                    .modifier(WaitText(appear: $waiting))
                
            }
        }
    }
    
    /* count num of button hits & go to next page after 5 */
    func checkCount(goNext: Binding<Bool>, alert: Binding<Bool>) {
        DispatchQueue.main.async {
            self.count += 1
        }
        if self.count >= 5 {
            goNext.wrappedValue.toggle()
        }
        else if self.count == 0 { alert.wrappedValue.toggle() }
    }
}

struct OrderingDoneView_Previews: PreviewProvider {
    static var previews: some View {
        OrderingDoneView()
    }
}
