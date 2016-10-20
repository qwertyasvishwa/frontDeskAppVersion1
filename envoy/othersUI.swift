//
//  othersUI.swift
//  envoy
//
//  Created by Vishwa Raj on 26/07/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class othersUI: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myContainer.layer.cornerRadius = 20
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myContainer: UIView!
    
    
    @IBAction func home(sender: AnyObject) {
        
        self.performSegueWithIdentifier("oHome", sender: nil)

    }
}