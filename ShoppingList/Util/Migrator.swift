//
//  Migrator.swift
//  ShoppingList
//
//  Created by Kanokchai Amaphut on 29/9/2566 BE.
//

import Foundation
import RealmSwift

class Migrator {
    
    let version = 4
    
    init() {
        updateSchema()
    }
    
    func updateSchema() {
        let config = Realm.Configuration(schemaVersion: UInt64(version)) { migration, oldSchemaVersion in
            if oldSchemaVersion < self.version {
                migration.enumerateObjects(ofType: ShoppingItem.className()) { oldObject, newObject in
                    newObject?["items"] = List<ShoppingItem>()
                }
            }
        }
        
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
    }
}
