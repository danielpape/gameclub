//
//  placeViewController.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 07/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit
import Social

class placeViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tubeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    
    var placeName = String()
    var placeLocation = String()
    var placeTube = String()
    var placeDistance = Float()
    var placeCategory = String()
    var placeDesc = String()
    var placeImage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = placeName
        locationLabel.text = placeLocation
        tubeLabel.text = placeTube
        categoryLabel.text = placeCategory
        descTextView.text = placeDesc
        mainImage.image = UIImage(named: placeImage)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tapShareButton(sender: AnyObject) {
        shareOnTwitter()
    }

    override func viewDidLayoutSubviews() {

    }
    
    func shareOnFacebook(){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            fbShare.title = "Game"
            fbShare.setInitialText("Check out this cool boardgame place in London")
            
            self.presentViewController(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    func shareOnTwitter(){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
        
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetShare.setInitialText("Check out this cool boardgame place in London")
        
            self.presentViewController(tweetShare, animated: true, completion: nil)
            
            } else {
            
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
