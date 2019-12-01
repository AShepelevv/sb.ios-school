//
//  MOImage.swift
//  redTeamSprint3
//
//  Created by Aleksey Shepelev on 22/11/2019.
//  Copyright © 2019 redTeam. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(MOImage)
internal class MOImage: NSManagedObject {
    @NSManaged var small: Data
    @NSManaged var large: Data
    
//    var smallImage = {
//        return UIImage(data: self.small)
//    }
//    
//    var largeImage = {
//        return UIImage(data: self.large)
//    }
}
