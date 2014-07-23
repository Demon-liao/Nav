//
//  BIDCheckListViewController.swift
//  Nav
//
//  Created by demon on 14-7-16.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDCheckListViewController: BIDSecondLeveViewController {
    var snacks:NSArray=[]
    var selectedSnacks:Int?
    let cellInd:NSString="Cell"
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title="Check One"
        self.rowImage=UIImage(named: "checkmarkControllerIcon")
        self.snacks=["Who Hash", "Bubba Gump Shrimp Étouffée","Who Pudding", "Scooby Snacks", "Everlasting Gobstopper","Green Eggs and Ham","Soylent Green","Hard Tack","Lembas Bread", "Roast Beast", "Blancmange"]
        self.selectedSnacks=NSNotFound //保存当前选中的行
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellInd)
        // Do any additional setup after loading the view.
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.snacks.count
    }
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(cellInd) as UITableViewCell
        cell.textLabel.text=self.snacks[indexPath.row] as String
        if(self.selectedSnacks==indexPath.row){
            cell.accessoryType=UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType=UITableViewCellAccessoryType.None
        }
        // Configure the cell...
        
        return cell
    }
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        if(indexPath.row != self.selectedSnacks){
            if(self.selectedSnacks != NSNotFound){
                //init(forRow row: Int, inSection section: Int) -> NSIndexPath
                var oldIndexPath:NSIndexPath=NSIndexPath(forRow:self.selectedSnacks!, inSection: 0)
                var oldCell:UITableViewCell=tableView.cellForRowAtIndexPath(oldIndexPath)
                oldCell.accessoryType=UITableViewCellAccessoryType.None
            }
            var cell:UITableViewCell=tableView.cellForRowAtIndexPath(indexPath)
            cell.accessoryType=UITableViewCellAccessoryType.Checkmark
            self.selectedSnacks=indexPath.row
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
