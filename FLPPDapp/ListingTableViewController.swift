//
//  ListingTableViewController.swift
//  FLPPDapp
//
//  Created by New User on 11/30/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//
/*
import UIKit

class ListingTableViewController: UITableViewController {

  
  //var  listingData = ["Listing 1", "Listing 2", "Listing 3"]
  
  
  let Title = "title"
  let Message = "message"
  
  @IBOutlet weak var tableViewVC: UITableView!
  var listingData : [String : Any]!

  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      
      tableViewVC.delegate = self
      tableViewVC.dataSource = self
      
      
       listingData  = ["title" : Title, "message" : Message ]
      
      
     
      
    }


  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listingData.count
    }

  
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
      // cell?.textLabel?.text = listingData[indexPath.row]
      
/*   let label1 = cell?.viewWithTag(1) as! UILabel
      label1.text = listingData[indexPath.row].title
      //posts should be listingData  -- figure out what I want title and message to be
      let label2 = cell?.viewWithTag(2) as! UILabel
      label2.text = listingData[indexPath.row].message

        return cell!
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
 

}
*/*/*/
