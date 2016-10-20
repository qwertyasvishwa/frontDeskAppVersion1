//
//  visitorsController.swift
//  envoy
//
//  Created by Vishwa Raj on 14/08/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class visitorsController: UITableViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var host: UITextField!
    @IBOutlet weak var usercompany: UITextField!
    @IBOutlet weak var userphone: UITextField!
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var mySubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 20;
        
        
        self.username.layer.borderColor = UIColor.grayColor().CGColor;
        self.username.layer.borderWidth=1
        self.username.layer.cornerRadius = 5
        
        self.useremail.layer.borderColor = UIColor.grayColor().CGColor;
        self.useremail.layer.borderWidth=1
        self.useremail.layer.cornerRadius = 5
        
        self.userphone.layer.borderColor = UIColor.grayColor().CGColor;
        self.userphone.layer.borderWidth=1
        self.userphone.layer.cornerRadius = 5
        
        self.usercompany.layer.borderColor = UIColor.grayColor().CGColor;
        self.usercompany.layer.borderWidth = 1
        self.usercompany.layer.cornerRadius = 5;
        
        self.host.layer.borderColor = UIColor.grayColor().CGColor;
        self.host.layer.borderWidth=1
        self.host.layer.cornerRadius = 5
        
        
        
        
        self.mySubmit.layer.cornerRadius = 15
        

        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: AnyObject) {
        
        
        
        let parameters = ["email": useremail.text!,"name": username.text!,"phone":userphone.text!,"company":usercompany.text!,"host":host.text!]
        print("\(parameters)")
        
        
        Alamofire.request(.POST, "http://vishwaraj.xyz/test/ivisitors.php", parameters: parameters)
            
            .responseJSON { (response: Response<AnyObject, NSError>) in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                print(response.result.error)
        }
        
        
        let myparameters = ["purpose": "Visitor","name": username.text!]
        print("\(parameters)")
        
        
        Alamofire.request(.POST, "http://vishwaraj.xyz/test/index.php", parameters: myparameters)

        
        self.performSegueWithIdentifier("visitorsfinal", sender: nil)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let secondvc : final = segue.destinationViewController as! final
        
        secondvc.message = "We have recieved your request. Your visiting pass is getting ready. Please collect it from the reception. Have a great time here."
        
    }
}