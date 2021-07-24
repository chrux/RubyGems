//
//  ViewController.swift
//  RubyGems
//
//  Created by Christian Torres on 7/23/21.
//

import UIKit
import CoreData

class ListViewController: UITableViewController {

    private var gems: [Gem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let managedContext = PersistenceController.shared.managedContext
        
        let fetchRequest = NSFetchRequest<Gem>(entityName: "Gem")
        
        do {
            gems = try managedContext.fetch(fetchRequest)
            self.tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gem = gems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GemTableViewCell", for: indexPath) as! GemTableViewCell
        
        cell.nameLbl.text = gem.name
        cell.mainColorLbl.text = gem.mainColor
        cell.photo.image = UIImage(named: gem.imageName!)
        
        return cell
    }
    
}

