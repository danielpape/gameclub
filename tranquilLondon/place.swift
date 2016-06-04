//
//  place.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 13/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let tubeName: String
    let placeCat: String
    let placeDesc:String
    let placeImage:String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName:String, placeCat:String, tubeName:String, coordinate:CLLocationCoordinate2D, description:String, placeImage:String) {
        self.title = title
        self.locationName = locationName
        self.tubeName = tubeName
        self.placeCat = placeCat
        self.coordinate = coordinate
        self.placeDesc = description
        self.placeImage = placeImage
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    class func fromJSON(json: [JSONValue]) -> Place? {
        // 1
        var title: String
        if let titleOrNil = json[0].string {
            title = titleOrNil
        } else {
            title = ""
        }
        let locationName = json[1].string
        let placeCat = json[2].string
        let tubeName = json[3].string
        let latitude = (json[4].string! as NSString).doubleValue
        let longitude = (json[5].string! as NSString).doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let description = json[6].string
        let lowerCaseString = helperMethods().makeStringLowerCaseAndRemoveNonAlphanumberic(title)
        let placeImage = lowerCaseString
        return Place(title: title, locationName: locationName!,placeCat: placeCat!,tubeName:tubeName!, coordinate: coordinate,description:description!,placeImage: placeImage)
    }
}