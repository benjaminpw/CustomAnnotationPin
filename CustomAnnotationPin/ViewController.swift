//
//  ViewController.swift
//  CustomAnnotationPin
//
//  Created by Benjamin Purbowasito on 20/08/19.
//  Copyright © 2019 iosda. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let location = CLLocationCoordinate2D(latitude: -6.175392, longitude: 106.827153)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
    }


}

