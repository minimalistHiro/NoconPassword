//
//  NoconPasswordApp.swift
//  NoconPassword
//
//  Created by 金子広樹 on 2023/08/13.
//

import SwiftUI

@main
struct NoconPasswordApp: App {
    let persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
