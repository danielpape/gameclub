//
//  placesTableViewController.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 07/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit
import MapKit

//struct place {
//    var name:String
//    var lat:CLLocationDegrees
//    var long:CLLocationDegrees
//    var tube:String
//    var category:String
//    var desc:String
//    
//    func getDistancetoPlace() -> Float{
//        return 2.5
//    }
//}

class placesTableViewController: UITableViewController {
    
    let VC = ViewController()
    var selectedRowTitle = String()
    var selectedRowImage = String()
    var selectedRowTube = String()
    var selectedRowLocation = String()
    var selectedRowDescription = String()
    var selectedRowCategory = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VC.loadInitialData()
        
        tableView.estimatedRowHeight = 96
        navigationController?.navigationBar.barTintColor = UIColor(red: 102/255, green: 204/255, blue: 255/255, alpha: 1)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VC.places.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:placeTableViewCell = (tableView.dequeueReusableCellWithIdentifier("cell") as? placeTableViewCell)!
        cell.placeNameLabel.text = String(VC.places[indexPath.row].title!)
        cell.placeDistanceLabel.text = String(VC.places[indexPath.row].locationName)
        cell.placeImage.image = UIImage(named: String(VC.places[indexPath.row].placeImage))
        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// TODO: Fix segue to detail view
        
        let destinationVC = segue.destinationViewController as! placeViewController
        var indexPath = tableView.indexPathForSelectedRow!.row
        
        destinationVC.placeName = String(VC.places[indexPath].title!)
        destinationVC.placeCategory = String(VC.places[indexPath].placeCat)
        destinationVC.placeDesc = String(VC.places[indexPath].placeDesc)
        destinationVC.placeTube = String(VC.places[indexPath].tubeName)
        destinationVC.placeLocation = String(VC.places[indexPath].locationName)
        destinationVC.placeImage = String(VC.places[indexPath].placeImage)
//
    }


}
