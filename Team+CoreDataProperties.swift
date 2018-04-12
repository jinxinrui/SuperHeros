//
//  Team+CoreDataProperties.swift
//  SuperHeros
//
//  Created by Jxr on 12/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var members: NSSet?

}

// MARK: Generated accessors for members
extension Team {

    @objc(addMembersObject:)
    @NSManaged public func addToMembers(_ value: SuperHero)

    @objc(removeMembersObject:)
    @NSManaged public func removeFromMembers(_ value: SuperHero)

    @objc(addMembers:)
    @NSManaged public func addToMembers(_ values: NSSet)

    @objc(removeMembers:)
    @NSManaged public func removeFromMembers(_ values: NSSet)

}
