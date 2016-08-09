//
//  MapViewController.swift
//  WordTrotter
//
//  Created by Marcin Sporysz on 05.08.2016.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
//    let userLocButton: UIButton!
    var locationManager: CLLocationManager!
    
    
    
    override func loadView(){
        mapView = MKMapView()
        mapView.delegate = self
        mapView.userTrackingMode = .Follow
        
        view = mapView

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let margins = view.layoutMarginsGuide
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        
        let userLocButton = UIButton(type: .System)
        
        userLocButton.setTitle("User", forState: .Normal)
        userLocButton.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        userLocButton.addTarget(self, action: #selector(MapViewController.userLocation(_:)), forControlEvents: .TouchUpInside)
        
        userLocButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userLocButton);
        
        userLocButton.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -10).active = true
        userLocButton.heightAnchor.constraintEqualToConstant(45).active = true
        userLocButton.widthAnchor.constraintEqualToConstant(45).active = true
        userLocButton.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor).active = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        print("Map View loaded.")
    }
    
    func userLocation(button: UIButton){
        print("przycisk")
        mapView.showsUserLocation = true
    }
    
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            mapView.mapType = .Standard
        }
    }
    
}