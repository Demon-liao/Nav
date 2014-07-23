//
//  BIDPresidentDetailViewController.swift
//  Nav
//
//  Created by demon on 14-7-22.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

var kNumberOfEditableRows:Int = 4
var kNameRowIndex:Int = 0
var kFromYearRowIndex:Int = 1
var kToYearRowIndex:Int = 2
var kPartyIndex:Int = 3
var kLabelTag = 2048
var kTextFieldTag = 4094
protocol BIDPresidentDetailViewControllerDelegate: NSObjectProtocol {
    @optional func presidentDetailViewController(controller:BIDPresidentDetailViewController,didUpdatePresident president:BIDPresident)
}
class BIDPresidentDetailViewController: UITableViewController ,UITextFieldDelegate {
    
    var president:BIDPresident!
    var delegate:BIDPresidentDetailViewControllerDelegate!
    var row:Int!
    var fieldLabels:Array<String>=[]
    var initialText:NSString?
    var hasChanges:Bool?
    init(style: UITableViewStyle) {
        super.init(style: UITableViewStyle.Grouped)
        self.fieldLabels=["Name","From","To","Party"]
        self.navigationItem.leftBarButtonItem=UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.Cancel,
            target:self,
            action:Selector("cancel:")
        )
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.Save,
            target:self,
            action:Selector("save:")
        )

    }
   // init(barButtonSystemItem systemItem: UIBarButtonSystemItem, target: AnyObject!, action: Selector)
    @IBAction func cancel(sender: AnyObject) {
        self.navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func save(sender: AnyObject) {
        self.view.endEditing(true)
        if(hasChanges){
            self.delegate!.presidentDetailViewController(self, didUpdatePresident: self.president)
        }
        self.navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func textFieldDone(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsSelection=false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return kNumberOfEditableRows
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        if(cell==nil){
            cell=UITableViewCell(
                style:UITableViewCellStyle.Default,
                reuseIdentifier:"Cell"
            )
            var label:UILabel=UILabel(frame: CGRectMake(10, 10, 75, 75))
            label.tag=kLabelTag
            label.textAlignment=NSTextAlignment.Right
            label.font=UIFont.boldSystemFontOfSize(14)
            cell.contentView.addSubview(label)
            
            var textField:UITextField=UITextField(frame:CGRectMake(90, 12, 200, 25))
            textField.tag=kTextFieldTag
            textField.clearsOnBeginEditing=false
            textField.delegate=self
            textField.returnKeyType=UIReturnKeyType.Done
            textField.addTarget(self, action: Selector("textFieldDone:"), forControlEvents: UIControlEvents.EditingDidEndOnExit)
            cell.contentView.addSubview(textField)
        }
        var lable:UILabel=cell.viewWithTag(kLabelTag) as UILabel
        lable.text=self.fieldLabels[indexPath.row] as String
        var textField:UITextField=cell.viewWithTag(kTextFieldTag) as  UITextField
        textField.superview.tag=indexPath.row
        switch (indexPath.row) {
            case kNameRowIndex:
                textField.text=self.president!.name
            case kFromYearRowIndex:
                textField.text=self.president!.fromYear
            case kToYearRowIndex:
                textField.text=self.president!.toYear
            case kPartyIndex:
                textField.text=self.president!.party
            default:
              break
        }
        return cell
    }
    func textFieldDidBeginEditing(textField: UITextField!) {
        self.initialText=textField.text
    }
    func textFieldDidEndEditing(textField: UITextField!){
        var _txt=textField.text as NSString
        if(!_txt.isEqualToString(self.initialText)){
            self.hasChanges=true
            switch (textField.superview.tag){
                case kNameRowIndex:
                    self.president!.name=textField.text
                case kFromYearRowIndex:
                    self.president!.fromYear=textField.text
                case kToYearRowIndex:
                    self.president!.toYear=textField.text
                case kPartyIndex:
                    self.president!.party=textField.text
            default:
                break
            }
        }
    }
    // #pragma mark - Table view data source




    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
