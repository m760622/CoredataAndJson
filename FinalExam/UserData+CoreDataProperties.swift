//
//  UserData+CoreDataProperties.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var newRelationship: NSSet?

}

// MARK: Generated accessors for newRelationship
extension UserData {

    @objc(addNewRelationshipObject:)
    @NSManaged public func addToNewRelationship(_ value: VenueData)

    @objc(removeNewRelationshipObject:)
    @NSManaged public func removeFromNewRelationship(_ value: VenueData)

    @objc(addNewRelationship:)
    @NSManaged public func addToNewRelationship(_ values: NSSet)

    @objc(removeNewRelationship:)
    @NSManaged public func removeFromNewRelationship(_ values: NSSet)

}
