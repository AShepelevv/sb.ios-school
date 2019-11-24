//
//  CoreDataService.swift
//  redTeamSprint3
//
//  Created by Aleksey Shepelev on 22/11/2019.
//  Copyright © 2019 redTeam. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService {
    
    let stack = CoreDataStack.shared

    func saveImage(smallImageData : Data, largeImageData: Data) {
        stack.persistentContainer.performBackgroundTask { (context) in
            let image = MOImage(context: context)
            image.small = smallImageData
            image.large = largeImageData
            do {
                try context.save()
            } catch {
                print("Image des not stored. The reason: \(error)")
            }
        }
    }
    
    func getFetcResultsController() -> NSFetchedResultsController<MOImage> {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MOImage>(entityName: "Image")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "small", ascending: true)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        return controller
    }
}
