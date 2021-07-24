//
//  Gem+CoreDataProperties.swift
//  RubyGems
//
//  Created by Christian Torres on 7/23/21.
//
//

import Foundation
import CoreData


extension Gem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gem> {
        return NSFetchRequest<Gem>(entityName: "Gem")
    }

    @NSManaged public var name: String?
    @NSManaged public var info: String?
    @NSManaged public var imageName: String?
    @NSManaged public var mainColor: String?
    @NSManaged public var crystalSystem: String?
    @NSManaged public var formula: String?
    @NSManaged public var transparency: String?
    @NSManaged public var hardness: String?
    @NSManaged public var id: String?

}

extension Gem : Identifiable {

}
