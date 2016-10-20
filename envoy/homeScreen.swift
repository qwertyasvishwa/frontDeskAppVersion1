//
//  homeScreen.swift
//  envoy
//
//  Created by Vishwa Raj on 20/07/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


class homeScreen: UIViewController {
    
    var myurl = "http://vishwaraj.xyz/test/select.php"
    func myload()
    {
        let requestURL = NSURL(string:myurl)
        let request = NSURLRequest(URL: requestURL!)
        myWeb.loadRequest(request)
        
    }
    

    
    
    @IBOutlet weak var myWeb: UIWebView!
    
    @IBAction func reprint(sender: AnyObject) {
        
        let printcontroller = UIPrintInteractionController.sharedPrintController()
        let printinfo = UIPrintInfo(dictionary:nil)
        printinfo.jobName = "Printing Label"
        printinfo.outputType = UIPrintInfoOutputType.Photo
        printcontroller.printInfo = printinfo
        printinfo.orientation = UIPrintInfoOrientation.Landscape
        printcontroller.printFormatter = myWeb.viewPrintFormatter()
        
        printcontroller.showsNumberOfCopies = false
        
        printcontroller.presentAnimated(true) { (_, isPrinted, error) in
            if error == nil
            {
                if isPrinted
                {
                    print ("Printed Successfully")
                }   else
                {
                    print ("Printing failed")
                }
                
            }
        }
        
        

        
    }
    
    @IBOutlet weak var visitors: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
      @IBOutlet weak var enquiry: UIButton!
    
    @IBOutlet weak var others: UIButton!
    
    @IBOutlet weak var events: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myload()
        

        // Do any additional setup after loading the view, typically from a nib.
        self.enquiry.layer.cornerRadius = 20;
        self.visitors.layer.cornerRadius=20;
        self.others.layer.cornerRadius = 20;
        self.events.layer.cornerRadius = 20;
        self.returnButton.layer.cornerRadius = 15;
        myWeb.reload();

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       @IBAction func eventsSubmit(sender: AnyObject) {
         self.performSegueWithIdentifier("eSegue", sender: nil)
        
    }
    
   
    @IBAction func otherSegue(sender: AnyObject) {
        self.performSegueWithIdentifier("oSegue", sender: nil)
    }
    
    @IBAction func visitorsSubmit(sender: AnyObject) {
         self.performSegueWithIdentifier("vSegue", sender: nil)
    }
    
    @IBAction func enquirySubmit(sender: AnyObject) {
        self.performSegueWithIdentifier("enSegue", sender: nil)
    }
    
}
