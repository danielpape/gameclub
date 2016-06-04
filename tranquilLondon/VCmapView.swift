//
//  VCmapView.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 13/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import Foundation

import MapKit

extension ViewController: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Place {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.rightCalloutAccessoryView = UIButton(type:.InfoDark) as UIView
                view.rightCalloutAccessoryView?.frame.size.width = 0
                view.pinColor = MKPinAnnotationColor.Purple
//                view.image = UIImage(named:annotation.placeImage)
                configureDetailView(view)
            return view
            }
        }
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
            performSegueWithIdentifier("showPlaceView", sender: view)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaceView"{
            let selectedAnnotation = sender?.annotation as! Place
            let destinationVC = segue.destinationViewController as! placeViewController
            destinationVC.placeName = selectedAnnotation.title!
            destinationVC.placeLocation = selectedAnnotation.locationName
            destinationVC.placeCategory = selectedAnnotation.placeCat
            destinationVC.placeDesc = selectedAnnotation.placeDesc
            destinationVC.placeTube = selectedAnnotation.tubeName
            destinationVC.placeImage = selectedAnnotation.placeImage

        }
    }
    
    func configureDetailView(annotationView: MKAnnotationView) {
        let width = 100
        let height = 100
        
        let snapshotView = UIView()
        let views = ["snapshotView": snapshotView]
        snapshotView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[snapshotView(110)]", options: [], metrics: nil, views: views))
        snapshotView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[snapshotView(125)]", options: [], metrics: nil, views: views))

        let imageView = UIImageView(frame: CGRect(x: 10, y: 15, width: width, height: height))
        let image = annotationView.annotation as! Place
        imageView.image = UIImage(named: String(image.placeImage))
        helperMethods().makeImageRound(imageView)
        snapshotView.addSubview(imageView)

        annotationView.detailCalloutAccessoryView = snapshotView
    }
}