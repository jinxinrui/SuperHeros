//
//  AddSuperHeroTableViewController.swift
//  SuperHeros
//
//  Created by Jxr on 14/3/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit
import CoreData

protocol AddSuperHeroProtocol {
    func addSuperHero(_ superHero: SuperHero) -> Bool
}

class AddSuperHeroTableViewController: UITableViewController {
    private var superHeroList: [SuperHero] = []
    private var managedObjectContext: NSManagedObjectContext
    var addSuperHeroDelegate: AddSuperHeroProtocol?
    
    required init(coder aDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: aDecoder)!
    }
    
    /*
    func initialiseSuperHeroList() {
        superHeroList.append(SuperHero(name: "Aqua Man", abilities: "Breathe underwater, Fast swimmer"))
            superHeroList.append(SuperHero(name: "Human Torch", abilities: "Flaming body, flying"))
            superHeroList.append(SuperHero(name: "Invisible Woman", abilities: "Invisibility, force field"))
            superHeroList.append(SuperHero(name: "Mister Fantastic", abilities: "Intelligence, Stretchy body"))
            superHeroList.append(SuperHero(name: "Spider-Man", abilities: "Agility, Strength, Spider-sense"))
            superHeroList.append(SuperHero(name: "Superman", abilities: "Flying, Strength, X-ray vision"))
            superHeroList.append(SuperHero(name: "Wonder Woman", abilities: "Strength, Speed, Longevity"))
            }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SuperHero")
        do {
            superHeroList = try managedObjectContext.fetch(fetchRequest) as! [SuperHero]
            if superHeroList.count == 0 {
                addSuperHeroData()
                // load newly added data
                superHeroList = try managedObjectContext.fetch(fetchRequest) as! [SuperHero]
            }
        }
        catch {
            fatalError("Failed to fetch super heroes: \(error)")
        }
    }
    
    func addSuperHeroData() {
        var hero = NSEntityDescription.insertNewObject(forEntityName: "SuperHero", into: managedObjectContext) as! SuperHero
        hero.name = "Aqua Man"
        hero.abilities = "Breathe underwater, Fast swimmer"
        
        hero = NSEntityDescription.insertNewObject(forEntityName: "SuperHero", into: managedObjectContext) as! SuperHero
        hero.name = "Human Torch"
        hero.abilities = "Flaming body, flying"
        
        hero = NSEntityDescription.insertNewObject(forEntityName: "SuperHero", into: managedObjectContext) as! SuperHero
        hero.name = "Invisible Woman"
        hero.abilities = "Invisibility, force field"
        
        hero = NSEntityDescription.insertNewObject(forEntityName: "SuperHero", into: managedObjectContext)
            as! SuperHero
        hero.name = "Mister Fantastic"
        hero.abilities = "Intelligence, Stretchy body"
        hero = NSEntityDescription.insertNewObject(forEntityName: "SuperHero", into: managedObjectContext)
            as! SuperHero
        hero.name = "Spider-Man"
        hero.abilities = "Agility, Strength, Spider-sense"
        hero = NSEntityDescription.insertNewObject(forEntityName: "SuperHero", into: managedObjectContext)
            as! SuperHero
        hero.name = "Superman"
        hero.abilities = "Flying, Strength, X-ray vision"
        hero = NSEntityDescription.insertNewObject(forEntityName: "SuperHero", into: managedObjectContext)
            as! SuperHero
        hero.name = "Wonder Woman"
        hero.abilities = "Strength, Speed, Longevity"
        
        do {
            try managedObjectContext.save()
        }
        catch let error {
            print("Could not save Core Data: \(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let superHero = superHeroList[indexPath.row]
        let superHeroAdded = addSuperHeroDelegate?.addSuperHero(superHero)
        if superHeroAdded != nil {
            // If there is a delegate, respond to whether it added super hero.
            if superHeroAdded == true {
                navigationController?.popViewController(animated: true)
            }
            else {
                tableView.deselectRow(at: indexPath, animated: true)
                // "??" means superHero.name != nil ? superHero.name! : "The super hero"
                let alert = UIAlertController(title: "Hero already on Team", message: "\(superHero.name ?? "The super hero") is already on the team.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .`default`, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return superHeroList.count
    }
 

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroCell", for: indexPath)

        // Configure the cell...
        let superHeroCell = cell as! SuperHeroTableViewCell
        superHeroCell.nameLabel.text = superHeroList[indexPath.row].name
        superHeroCell.abilityLabel.text = superHeroList[indexPath.row].abilities

        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
