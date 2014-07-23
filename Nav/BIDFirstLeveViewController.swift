//
//  BIDFirstLeveViewController.swift
//  Nav
//
//  Created by demon on 14-7-14.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit
class BIDFirstLeveViewController: UITableViewController {
    var controllers:NSArray=[]
    let cellInd:NSString="Cell"
//    init(coder: NSCoder){
//        super.init(coder: coder)
//        
//    }
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)  {
        super.init(nibName: nibNameOrNil,bundle: nibBundleOrNil)
        self.title="First level"
        self.controllers=[
            BIDDisclosureViewController(nibName:nil,bundle:nil),
            BIDCheckListViewController(nibName:nil,bundle:nil),
            BIDRowControlsViewController(nibName:nil,bundle:nil),
            BIDMoveMeViewController(nibName:nil,bundle:nil),
            BIDDeleteMeViewController(nibName:nil,bundle:nil),
            BIDPresidentsViewController(nibName:nil,bundle:nil)
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellInd)
        self.tableView.separatorInset.bottom=1
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.controllers.count
    }


    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellInd) as UITableViewCell
        println("1")
        var controller:BIDSecondLeveViewController=self.controllers[indexPath.row] as BIDSecondLeveViewController
        cell.textLabel.text=controller.title
        cell.imageView.image=controller.rowImage
        // Configure the cell...

        return cell
    }
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
       
        var controller:BIDSecondLeveViewController=self.controllers[indexPath.row] as BIDSecondLeveViewController
        self.navigationController.pushViewController(controller, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
