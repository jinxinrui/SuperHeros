//
//  SuperHero+CoreDataProperties.swift
//  SuperHeros
//
//  Created by Jxr on 12/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//
//

import Foundation
import CoreData


extension SuperHero {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SuperHero> {
        return NSFetchRequest<SuperHero>(entityName: "SuperHero")
    }

    @NSManaged public var name: String?
    @NSManaged public var abilities: String?
    @NSManaged public var team: Team?

}
