//
//  AddSuperHeroTableViewController.swift
//  SuperHeros
//
//  Created by Jxr on 14/3/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit

protocol AddSuperHeroProtocol {
    func newSuperHero(superHero: SuperHero)
}

class AddSuperHeroTableViewController: UITableViewController {
    var superHeroList: [SuperHero] = []
    var addSuperHeroDelegate: AddSuperHeroProtocol?
    
    
    func initialiseSuperHeroList() {
        superHeroList.append(SuperHero(name: "Aqua Man", abilities: "Breathe underwater, Fast swimmer"))
            superHeroList.append(SuperHero(name: "Human Torch", abilities: "Flaming body, flying"))
            superHeroList.append(SuperHero(name: "Invisible Woman", abilities: "Invisibility, force field"))
            superHeroList.append(SuperHero(name: "Mister Fantastic", abilities: "Intelligence, Stretchy body"))
            superHeroList.append(SuperHero(name: "Spider-Man", abilities: "Agility, Strength, Spider-sense"))
            superHeroList.append(SuperHero(name: "Superman", abilities: "Flying, Strength, X-ray vision"))
            superHeroList.append(SuperHero(name: "Wonder Woman", abilities: "Strength, Speed, Longevity"))
            }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call initialiseSuperHeroList()
        initialiseSuperHeroList()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        addSuperHeroDelegate?.newSuperHero(superHero: superHeroList[indexPath.row])
        navigationController?.popViewController(animated: true)
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
