//
//  PersistenceController.swift
//  RubyGems
//
//  Created by Christian Torres on 7/23/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    // MARK: - Core Data stack

    let container: NSPersistentContainer
    
    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    var isFirstTimeLaunch: Bool {
        let key = "first_time_launch"
        guard UserDefaults.standard.bool(forKey: key) else {
            UserDefaults.standard.setValue(true, forKey: key)
            return true
        }
        
        return false
    }
    
    init() {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        container = NSPersistentContainer(name: "RubyGems")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        if isFirstTimeLaunch {
            createInitialGems(viewContext: container.viewContext)
            
            saveContext()
        }
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createInitialGems(viewContext: NSManagedObjectContext) {
        let rose = Gem(context: viewContext)
        rose.name = "Rose Quartz"
        rose.id = "rose-quartz"
        rose.info = "A pinkish quartz, found in many shapes and sizes. Rose Quartz was once the leader of the Crystal Gems."
        rose.imageName = "rose"
        rose.mainColor = "rose"
        rose.crystalSystem = "Hexagonal crystal system"
        rose.formula = "SiO₂"
        rose.hardness = "7"
        rose.transparency = "Translucent, Transparent"
//        rose.timestamp = Date()

        let lapis = Gem(context: viewContext)
        lapis.name = "Lapis Lazuli"
        lapis.id = "lapis-lazuli"
        lapis.info = """
        Lapis lazuli is a deep-blue rock used to create semiprecious stones and artifacts.
        Lapis Lazuli once terraformed planets for Homeworld.
        """
        lapis.imageName = "lapis"
        lapis.mainColor = "blue"
        lapis.crystalSystem = "Cubic crystal system"
        lapis.formula = "(Na,Ca)₈Al₆Si₆O₂₄ (S,SO)₄"
        lapis.hardness = "5 – 5.5"
        lapis.transparency = "Opaque"
//        lapis.timestamp = Date()

        let ruby = Gem(context: viewContext)
        ruby.name = "Ruby"
        ruby.id = "ruby"
        ruby.info = """
        Ruby is a blood red gemstone.
        Rubies were used in armor and placed under the foundation of buildings to ensure good fortune.
        They are great warriors but usually hotheaded and easily distracted.
        """
        ruby.imageName = "ruby"
        ruby.mainColor = "ruby"
        ruby.crystalSystem = "Hexagonal crystal system"
        ruby.formula = "Al₂O₃"
        ruby.hardness = "9"
        ruby.transparency = "Opaque, Transparent"
//        ruby.timestamp = Date()

        let sapphire = Gem(context: viewContext)
        sapphire.name = "Sapphire"
        sapphire.id = "sapphire"
        sapphire.info = """
        Sapphire is a blue precious gemstone not typically used in costume jewelry.
        Sapphire has the power to see branches of the future.
        """
        sapphire.imageName = "sapphire"
        sapphire.mainColor = "blue"
        sapphire.crystalSystem = "Hexagonal crystal system"
        sapphire.formula = "Al₂O₃"
        sapphire.hardness = "9"
        sapphire.transparency = "Opaque, Transparent"
//        sapphire.timestamp = Date()

        let amethyst = Gem(context: viewContext)
        amethyst.name = "Amethyst"
        amethyst.id = "amethyst"
        amethyst.info = """
        Amethyst is a violet variety of quartz.
        Considered semiprecious, it is often used in jewelry.
        The name derives from the Greek a-methustos, not drunk.
        Ancient Greeks believed this gem prevented insobriety and often carved wine goblets from it.
        Amethysts are big strong warriors, but the little ones are even stronger.
        """
        amethyst.imageName = "amethyst"
        amethyst.mainColor = "purple"
        amethyst.crystalSystem = "Hexagonal crystal system"
        amethyst.formula = "SiO₂"
        amethyst.hardness = "7"
        amethyst.transparency = "Translucent, Transparent"
//        amethyst.timestamp = Date()

        let pearl = Gem(context: viewContext)
        pearl.name = "Pearl"
        pearl.id = "pearl"
        pearl.info = """
        Pearl is a hard, usually white- or beige-colored substance, produced inside an oyster.
        Pearls are ground into cosmetics and sewn onto clothing.
        They were created to serve, due to their caring nature, but make no mistake: once free, Pearls are loyal leaders.
        """
        pearl.imageName = "pearl"
        pearl.mainColor = "beige"
        pearl.crystalSystem = "Hexagonal crystal system"
        pearl.formula = "Calcium carbonate, CaCO3 Conchiolin"
        pearl.hardness = "2.5 – 4.5"
        pearl.transparency = "Opaque"
//        pearl.timestamp = Date()

        let peridot = Gem(context: viewContext)
        peridot.name = "Peridot"
        peridot.id = "peridot"
        peridot.info = """
        Peridot is a light green gem. In the Middle Ages, peridots were believed to have healing powers.
        Peridots may seem rather cold, but once they get to know you, they get really attached.
        They are very smart and can handle technology very well.
        """
        peridot.imageName = "peridot"
        peridot.mainColor = "green"
        peridot.crystalSystem = "Orthorhombic crystal system"
        peridot.formula = "(Mg,Fe)₂SiO₄"
        peridot.hardness = "6.5 – 7"
        peridot.transparency = "Opaque"
//        peridot.timestamp = Date()

        let bismuth = Gem(context: viewContext)
        bismuth.name = "Bismuth"
        bismuth.id = "bismuth"
        bismuth.info = """
        Bismuth is a gemstone with a metallic shine.
        It is element 83 on the periodic table.
        Bismuths excel at building structures and forging weapons.
        """
        bismuth.imageName = "bismuth"
        bismuth.mainColor = "metal"
        bismuth.crystalSystem = "n/a"
        bismuth.formula = "(Mg,Fe)₂SiO₄"
        bismuth.hardness = "2.25"
        bismuth.transparency = "n/a"
//        bismuth.timestamp = Date()
    }

}
