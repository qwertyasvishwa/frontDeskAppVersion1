//
//  enquiryUI.swift
//  envoy
//
//  Created by Vishwa Raj on 26/07/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class enquiryUI: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func home(sender: AnyObject) {
        self.performSegueWithIdentifier("enHome", sender: nil)
        
    }
    
    
    
}