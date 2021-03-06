//
//  CurrentTeamTableViewController.swift
//  SuperHeros
//
//  Created by Jxr on 14/3/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit

class CurrentTeamTableViewController: UITableViewController, AddSuperHeroProtocol {
    private var superHeroList: [SuperHero] = []
    
    private let SECTION_HEROS = 0
    private let SECTION_COUNT = 1
    
    func initiliseSuperHeroList() {
        superHeroList.append(SuperHero(name: "Wonder Woman", abilities: "Strength, Speed, Longevity"))
        superHeroList.append(SuperHero(name: "Superman", abilities: "Flying, Strength, X-ray vision"))
        superHeroList.append(SuperHero(name: "Spider-Man", abilities: "Agility, Strength, Spider-sense"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initiliseSuperHeroList()

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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (section == SECTION_COUNT) {
            return 1
        }
        return superHeroList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellReuseIdentifier = "SuperHeroCell"
        if indexPath.section == SECTION_COUNT {
            cellReuseIdentifier = "TotalCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        // Configure the cell...
        if indexPath.section == SECTION_HEROS {
            let superHeroCell = cell as! SuperHeroTableViewCell
            
            superHeroCell.nameLabel.text = superHeroList[indexPath.row].name
            superHeroCell.abilityLabel.text = superHeroList[indexPath.row].abilities
        }
        else {
            cell.textLabel?.text = "\(superHeroList.count) Super Heros"
        }

        return cell
    }
  
    func newSuperHero(superHero: SuperHero) {
        superHeroList.append(superHero)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: superHeroList.count - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
        
        tableView.reloadSections([SECTION_COUNT], with: .automatic)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "AddSuperHeroSegue" {
            let controller = segue.destination as! AddSuperHeroTableViewController
            controller.addSuperHeroDelegate = self
        }
    }
    

}
