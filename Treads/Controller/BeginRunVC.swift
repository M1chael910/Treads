//
//  BeginRunVC.swift
//  Treads
//
//  Created by Michael  Murphy on 8/26/18.
//  Copyright © 2018 Michael  Murphy. All rights reserved.
//

import UIKit
import MapKit

class BeginRunVC: LocationVC {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthStatus()
        mapView.delegate = self
        print(Run.getAllRuns())
    }
    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        manager?.startUpdatingLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        manager?.stopUpdatingLocation()
    }

    @IBAction func locationCenterBtnPressed(_ sender: Any) {
        
    }
    
}

extension BeginRunVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            checkLocationAuthStatus()
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
    }
}
