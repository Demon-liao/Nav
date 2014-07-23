//
//  BIDMoveMeViewController.swift
//  Nav
//
//  Created by demon on 14-7-17.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDMoveMeViewController: BIDSecondLeveViewController {
    var words:Array<String>=[]
      let cellInd:NSString="Cell"
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title="Move me"
        self.rowImage=UIImage(named: "moveMeIcon")
        self.words=["Who Hash", "Bubba Gump Shrimp Étouffée","Who Pudding", "Scooby Snacks", "Everlasting Gobstopper","Green Eggs and Ham","Soylent Green","Hard Tack","Lembas Bread", "Roast Beast", "Blancmange"]
        self.navigationItem.rightBarButtonItem=self.editButtonItem()//显示编辑按钮
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellInd)
        // Do any additional setup after loading the view.
    }
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.words.count
    }
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(cellInd) as UITableViewCell
        cell.textLabel.text=self.words[indexPath.row] as String
        // Configure the cell...
        
        return cell
    }
    override func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.None
    }
    override func tableView(tableView: UITableView!, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return false
    }
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {
        var object:String=self.words[sourceIndexPath.row] as String
        self.words.removeAtIndex(sourceIndexPath.row)
        self.words.insert(object, atIndex: destinationIndexPath.row)
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
