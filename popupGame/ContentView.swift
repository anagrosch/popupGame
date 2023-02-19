//
//  ContentView.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/19/23.
//

import SwiftUI
import CoreData

struct MyButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View { configuration.label
            .padding()
            .font(.system(size: 15, weight: Font.Weight.bold))
            .foregroundColor(.white)
            .frame(width: 100, height: 40)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan))
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var hoverNoButton = false
    @State private var yesButtonClicked = false
    @State private var isShadow = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text(yesButtonClicked ? "I knew it!" : "Are you stupid?")
                .padding()
                .font(.system(size: 30))
                .bold()
                .frame(width: 500, height: yesButtonClicked ? 190 : 120, alignment: .bottom)
                .position(x: 250, y: 70)
            
            if yesButtonClicked {
                Text("Hehe I got you :)")
                    .padding()
                    .font(.system(size: 15))
                    .frame(width: 500, height: 100, alignment: .top)
            }
            
            if !yesButtonClicked {
                HStack {
                    Button("Yes!") {
                        yesButtonClicked.toggle()
                    }.buttonStyle(MyButton())
                        //.position(x: 196, y: 73)
                        //.position(x: 0, y: 10)
                        .shadow(color: .blue, radius: isShadow ? 5 : 0)
                        .onHover { hover in
                            isShadow = hover
                        }
                    
                    Button("No") {
                        //do nothing
                    }.buttonStyle(MyButton())
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
    
    /*
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }*/
}
/*
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .frame(width: 500, height: 300)
    }
}
