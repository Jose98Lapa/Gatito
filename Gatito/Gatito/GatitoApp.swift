//
//  GatitoApp.swift
//  Gatito
//
//  Created by José Miguel Lapa on 11/08/2024.
//

import SwiftUI

@main
struct GatitoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
