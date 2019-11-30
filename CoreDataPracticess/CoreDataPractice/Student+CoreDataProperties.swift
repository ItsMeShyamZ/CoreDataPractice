//
//  Student+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Abservetech on 17/10/19.
//  Copyright © 2019 Abservetech. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var standard: Int64
    @NSManaged public var schools: School?

}
