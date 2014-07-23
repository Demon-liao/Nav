//
//  BIDDeleteMeViewController.swift
//  Nav
//
//  Created by demon on 14-7-18.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDDeleteMeViewController: BIDSecondLeveViewController {
    var computers:NSMutableArray?
    let cellInd:NSString="Cell"
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title="Delete me"
        self.rowImage=UIImage(named: "deleteMeIcon")
        var bundle=NSBundle.mainBundle()
        var plistURL:NSURL=bundle.URLForResource("computers", withExtension: "plist")
        self.computers=NSMutableArray(contentsOfURL: plistURL)
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
        return self.computers!.count
    }
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(cellInd) as UITableViewCell
        cell.textLabel.text=self.computers![indexPath.row] as String
        // Configure the cell...
        
        return cell
    }
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        self.computers!.removeObjectAtIndex(indexPath.row)
       // var index=NSArray.arrayWithArray(<#array: [AnyObject]?#>)
        tableView.deleteRowsAtIndexPaths(NSArray(object: indexPath), withRowAnimation: UITableViewRowAnimation.Automatic)
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
