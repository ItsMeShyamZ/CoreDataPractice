//
//  User+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Abservetech on 17/10/19.
//  Copyright © 2019 Abservetech. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: String?
    @NSManaged public var username: String?

}
