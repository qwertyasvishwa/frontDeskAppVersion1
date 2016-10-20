//
//  final.swift
//  envoy
//
//  Created by Vishwa Raj on 04/08/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class final: UIViewController {
    
    @IBOutlet weak var myWeb: UIWebView!
    var myurl = "http://vishwaraj.xyz/test/select.php"
    func myload()
    {
        let requestURL = NSURL(string:myurl)
        let request = NSURLRequest(URL: requestURL!)
        myWeb.loadRequest(request)
        
        
    }
   
    
   
    @IBAction func sendPrint(sender: AnyObject) {
        
        
       
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
        self.performSegueWithIdentifier("finaltohome", sender: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myload()

        label.text = message;
        myWeb.reload();
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var label: UILabel!
    var message = String();
    
    
    
}