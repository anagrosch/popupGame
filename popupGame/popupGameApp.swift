//
//  popupGameApp.swift
//  popupGame
//
//  Created by Coding on 2/19/23.
//

import SwiftUI

@main
struct popupGameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
