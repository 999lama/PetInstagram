//
//  PetIstagramApp.swift
//  PetIstagram
//
//  Created by Lama Albadri on 16/03/2024.
//

import SwiftUI

@main
struct PetIstagramApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
