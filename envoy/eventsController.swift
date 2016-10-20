//
//  eventsController.swift
//  envoy
//
//  Created by Vishwa Raj on 26/07/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class eventsController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 20
        
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
        self.usercompany.layer.borderWidth=1
        self.usercompany.layer.cornerRadius = 5
        
        self.eventsname.layer.borderColor = UIColor.grayColor().CGColor;
        self.eventsname.layer.borderWidth=1
        self.eventsname.layer.cornerRadius = 5
        
        self.mySubmit.layer.cornerRadius = 15
        

        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    @IBOutlet weak var mySubmit: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var useremail: UITextField!
    
    @IBOutlet weak var eventsname: UITextField!
    @IBOutlet weak var userphone: UITextField!
    @IBOutlet weak var usercompany: UITextField!
    
    
    @IBAction func submit(sender: AnyObject) {
        
        
        let parameters = ["email": useremail.text!,"name": username.text!,"phone":userphone.text!,"company":usercompany.text!,"eventname":eventsname.text!]
        print("\(parameters)")
        
        
        Alamofire.request(.POST, "http://vishwaraj.xyz/test/ievents.php", parameters: parameters)
            
            .responseJSON { (response: Response<AnyObject, NSError>) in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                print(response.result.error)
        }
        
        
        let myparameters = ["purpose": "Event","name": username.text!]
        print("\(parameters)")
        
        
        Alamofire.request(.POST, "http://vishwaraj.xyz/test/index.php", parameters: myparameters)
                self.performSegueWithIdentifier("eventsfinal", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let secondvc : final = segue.destinationViewController as! final
        
        secondvc.message = "Thank You. Please share the exprience and feedback post event and let us know how we can imporve it. Enjot the day."
        
    }
    

    
}