//
//  FoodTableViewController.swift
//  Meal_Tracker
//
//  Created by Anmol Mehta on 18/08/25.
//

import UIKit

class FoodTableViewController: UITableViewController {
    var meals : [Meal] {
            let breakfast = Meal(name: "Breakfast", food: [food1,food2,food3,lunch1,lunch2,lunch3,dinner1,dinner2,dinner3])
            let lunch  = Meal(name: "Lunch", food: [lunch1,lunch2,lunch3,food1,food2,food3,dinner1,dinner2,dinner3])
            let dinner = Meal(name: "Dinner", food: [dinner1,dinner2,dinner3,food1,food2,food3,lunch1,lunch2,lunch3])
            return [breakfast , lunch , dinner]
        }
        var food1 = Food(name: "Bread", description : "White Bread")
        var food2 = Food(name: "Eggs", description : " Egg Whites")
        var food3 = Food(name: "Milk", description : " Cow Milk")
        
        var lunch1 = Food(name: "Rice", description : "Brown Rice")
        var lunch2 = Food(name: "Pasta", description : "Spaghetti")
        var lunch3 = Food(name: "Rajmah", description : "Rajmah rice")
        
        var dinner1 = Food(name: "Chicken", description : " Kadhai Chicken")
        var dinner2 = Food(name: "Paneer", description : " Paneer Cheese")
        var dinner3 = Food(name: "Naan", description : "  Garlic Naan")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text =  meals[indexPath.section].food[indexPath.row].name
        content.secondaryText = meals[indexPath.section].food[indexPath.row].description
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
