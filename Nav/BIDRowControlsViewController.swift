//
//  BIDRowControlsViewController.swift
//  Nav
//
//  Created by demon on 14-7-17.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDRowControlsViewController: BIDSecondLeveViewController {
    var characters:NSArray=[]
    let cellInd:NSString="Cell"
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title="Row controls"
        self.rowImage=UIImage(named: "rowControlsIcon")
        self.characters=["R2-D2", "C3PO", "Tik-Tok", "Robby","Rosie", "Uniblab", "Bender", "Marvin","Lt. Commander Data", "Evil Brother Lore", "Optimus Prime","Tobor", "HAL", "Orgasmatron"]
        
    }
    @IBAction func tappedButton(sender: AnyObject) {
         var  row:Int=sender.tag
         var character:NSString=self.characters[row] as NSString
         var alert=UIAlertView()
        alert.title="You tapped"
        alert.message=character
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellInd)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.characters.count
    }
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(cellInd) as UITableViewCell
        cell.textLabel.text=self.characters[indexPath.row] as String
        if(cell.accessoryView==nil){
            var buttonUpImage:UIImage=UIImage(named: "button_up")
            var buttonDownImage:UIImage=UIImage(named: "button_down")
            var button:UIButton=UIButton.buttonWithType(UIButtonType.Custom) as UIButton
           // buttonWithType()
            button.setBackgroundImage(buttonUpImage, forState: UIControlState.Normal)
            button.setBackgroundImage(buttonDownImage, forState: UIControlState.Highlighted)
            button.setTitle("Tap", forState: UIControlState.Normal)
            button.sizeToFit()
           // button.addTarget(target: AnyObject?, action: Selector, forControlEvents: <#UIControlEvents#>)
            button.addTarget(self, action:Selector("tappedButton:") , forControlEvents: UIControlEvents.TouchUpInside)
            cell.accessoryView=button
        }
        println(cell.accessoryView==nil)
        cell.accessoryView.tag = indexPath.row
        // Configure the cell...
        
        return cell
    }
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        var character:NSString = self.characters[indexPath.row] as NSString
        var alert=UIAlertView()
        alert.title="You tapped row"
        alert.message=character
        alert.addButtonWithTitle("OK")
        alert.show()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
