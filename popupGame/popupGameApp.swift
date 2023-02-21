//
//  popupGameApp.swift
//  popupGame
//
//  Created by Anastasia Grosch on 2/19/23.
//

import SwiftUI

@main
struct popupGameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .frame(minWidth: 500, idealWidth: 500, maxWidth: 500,
                        minHeight: 300, idealHeight: 300, maxHeight: 800,
                        alignment: .center)
        }
    }
}
