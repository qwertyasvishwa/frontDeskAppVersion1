//
//  enquiryController.swift
//  envoy
//
//  Created by Vishwa Raj on 26/07/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class enquiryController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
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
        self.usercompany.layer.borderWidth=1
        self.usercompany.layer.cornerRadius = 5
        
        self.websites.layer.borderColor = UIColor.grayColor().CGColor;
        self.websites.layer.borderWidth=1
        self.websites.layer.cornerRadius = 5
        
        self.mySubmit.layer.cornerRadius = 15
        
        self.industryPicker.dataSource = self
        self.industryPicker.delegate = self
        self.companyPicker.dataSource = self
        self.companyPicker.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
           }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        
        
        return 1
        
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return industry.count
        
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if industryPicker == pickerView {
            return industry[row]
        }
        
        else
        {
            return company[row]
        }
        
     
        
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if industryPicker == pickerView {
            
            
            if (row == 0)
            {
                industrytype = "IT"
            }
            else if (row == 1)
            {
                industrytype = "Automobiles"
            }
            else if (row == 2)
            {
                industrytype = "Advertising"
            }
                
            else{
                industrytype = "Others"
            }
            

            
        }
            
        else
        {
            
            if (row == 0)
            {
                ctype = "Startups"
            }
            else if (row == 1)
            {
                ctype = "OPC"
            }
            else if (row == 2)
            {
                ctype = "LLP"
            }
                
            else{
                ctype = "Others"
            }

           
        }
        
    }
    
    
    
    
    
    @IBOutlet weak var companyPicker: UIPickerView!
    
    override func viewDidAppear(animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    var ctype : String = "Startups"
    
    var industrytype : String = "Automobiles"
    
    var industry = ["IT", "Automobiles", "Advertising", "Others"];
    
    var company = ["Startups", "OPC", "LLP", "Others"]
    
    @IBOutlet weak var industryPicker: UIPickerView!
    
    
    @IBOutlet weak var mySubmit: UIButton!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var useremail: UITextField!
    
    @IBOutlet weak var websites: UITextField!
    
    @IBOutlet weak var userphone: UITextField!
    
    
    @IBOutlet weak var usercompany: UITextField!
    
    
    
    @IBAction func submit(sender: AnyObject) {
        
        
        
        let parameters = ["email": useremail.text!,"name": username.text!,"phone":userphone.text!,"company":usercompany.text!,"companytype":ctype, "website":websites.text!, "industry":industrytype]
        print("\(parameters)")
        
        
        Alamofire.request(.POST, "http://vishwaraj.xyz/test/ienquiry.php", parameters: parameters)
            
            .responseJSON { (response: Response<AnyObject, NSError>) in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                print(response.result.error)
        }
        
        
        let myparameters = ["purpose": "Enquiry","name": username.text!]
        print("\(parameters)")
        
        
        Alamofire.request(.POST, "http://vishwaraj.xyz/test/index.php", parameters: myparameters)
        
        self.performSegueWithIdentifier("enquiryfinal", sender: nil)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let secondvc : final = segue.destinationViewController as! final
        
        secondvc.message = "Thanks for Signin. Your enquiry has been submitted."
        
    }
    
    
    
}