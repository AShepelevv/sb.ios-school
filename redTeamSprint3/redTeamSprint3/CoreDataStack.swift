//
//  CoreDataStack.swift
//  redTeamSprint3
//
//  Created by Aleksey Shepelev on 22/11/2019.
//  Copyright © 2019 redTeam. All rights reserved.
//

import Foundation
import CoreData

internal final class CoreDataStack {

    static let shared: CoreDataStack = {
        let coreDataStack = CoreDataStack()
        return coreDataStack
    }()

    let persistentContainer: NSPersistentContainer

    private init() {
        let group = DispatchGroup()
        persistentContainer = NSPersistentContainer(name: "Datamodel")
        group.enter()
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            group.leave()
        }
        group.wait()
    }
}
