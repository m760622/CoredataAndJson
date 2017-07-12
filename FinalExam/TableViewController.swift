//
//  TableViewController.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
  var store = FourSquareWSStore()
    var displayList : [Venue] = []
    var venueStore = VenueStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchVenue{
            (venueResult) -> Void in
            switch venueResult {
            case let .success(venues):
                print("Successfully found \(venues.count) venues.")
                self.displayList = venues
                self.venueStore.clearCoreData()
                self.venueStore.saveInCoreData(displayList: self.displayList)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print("Error fetching recent venue: \(error)")
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
        return self.displayList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! Cell1

        let venue = displayList[indexPath.row]
        // Configure the cell...
        cell.name.text = venue.name
        cell.contact.text = "Contact: " + venue.contact
        cell.distance.text = "distance: "+venue.distance

        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellToDetail"{
            let VC = segue.destination as! DetailsViewController
            VC.currentName = displayList[(self.tableView.indexPathForSelectedRow?.row)!].name
            
        }
    }//end prepare
    

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
