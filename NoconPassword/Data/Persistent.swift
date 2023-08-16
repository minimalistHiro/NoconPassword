//
//  Persistent.swift
//  NoconPassword
//
//  Created by 金子広樹 on 2023/08/14.
//

import Foundation
import CoreData

enum FocusField {
    case title
    case userName
    case password
    case url
    case memo
}

enum Views {
    case newPasswordView
    case editView
}

struct PersistenceController {
    let container: NSPersistentCloudKitContainer
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for num in 0..<5 {
            let newItem = Entity(context: viewContext)
            newItem.title = "title\(num + 1)"
            newItem.username = "username\(num + 1)"
            newItem.password = "password\(num + 1)"
            newItem.url = "url\(num + 1)"
            newItem.memo = "memo\(num + 1)"
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Model")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

