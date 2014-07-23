//
//  BIDDisclosureDetailViewController.swift
//  Nav
//
//  Created by demon on 14-7-14.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDDisclosureDetailViewController: UIViewController {
    var lableView:UILabel?
    var label:UILabel!{
        get{
            return self.lableView
        }
        set{
            self.view=self.lableView
        }
    }
    var message:NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        var label:UILabel=UILabel()
        label.numberOfLines=0
        label.textAlignment=NSTextAlignment.Center
        self.lableView=label
        self.view=self.lableView

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text=self.message
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
