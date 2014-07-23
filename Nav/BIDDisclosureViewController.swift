//
//  BIDDisclosureViewController.swift
//  Nav
//
//  Created by demon on 14-7-14.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDDisclosureViewController: BIDSecondLeveViewController {
    var movies:Array<String>=[]
    var detailController:BIDDisclosureDetailViewController!
    let cellInd:NSString="Cell"
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title="Disclosure Buttons"
        self.rowImage=UIImage(named: "disclosureButtonControllerIcon")
        self.movies=["Toy story","A bug life","Toy","bug","DoG","WWHY"]
        
        self.detailController=BIDDisclosureDetailViewController()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
//        self.tableView.delegate=self
//        self.tableView.dataSource=self
//        var _cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
//        self.tableView.addSubview(_cell)
        println(self.tableView.frame)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellInd)
        // Do any additional setup after loading the view.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.movies.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(cellInd) as UITableViewCell
        
        cell.accessoryType=UITableViewCellAccessoryType.DetailDisclosureButton
        cell.textLabel.text=self.movies[indexPath.row] as String
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        var alert:UIAlertView=UIAlertView()
        alert.title="选择"
        alert.message="toch"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    override func tableView(tableView: UITableView!, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath!) {
        self.detailController!.title="DIS pressed"
        var selectedMovie=self.movies[indexPath.row] as String
        var detailMsg="This is for  \(selectedMovie)"
        self.detailController!.message=detailMsg
        self.detailController!.title=selectedMovie
        self.navigationController.pushViewController(self.detailController, animated: true)
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
