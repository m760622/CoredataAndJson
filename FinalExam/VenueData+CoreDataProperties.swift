//
//  VenueData+CoreDataProperties.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import Foundation
import CoreData


extension VenueData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VenueData> {
        return NSFetchRequest<VenueData>(entityName: "VenueData")
    }

    @NSManaged public var name: String?
    @NSManaged public var contact: String?
    @NSManaged public var distance: String?
    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var checkingsCount: String?
    @NSManaged public var newRelationship: NSSet?

}

// MARK: Generated accessors for newRelationship
extension VenueData {

    @objc(addNewRelationshipObject:)
    @NSManaged public func addToNewRelationship(_ value: UserData)

    @objc(removeNewRelationshipObject:)
    @NSManaged public func removeFromNewRelationship(_ value: UserData)

    @objc(addNewRelationship:)
    @NSManaged public func addToNewRelationship(_ values: NSSet)

    @objc(removeNewRelationship:)
    @NSManaged public func removeFromNewRelationship(_ values: NSSet)

}
