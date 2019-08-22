//
//  ViewController.swift
//  CustomAnnotationPin
//
//  Created by Benjamin Purbowasito on 20/08/19.
//  Copyright © 2019 iosda. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(pinTitle: String, pinSubTitle: String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
    
    func getTitleName() -> String {
        return self.title!
    }
    
    func getSubTitleName() -> String {
        return self.subtitle!
    }
}

class ViewController: UIViewController, MKMapViewDelegate {

    
    
    @IBOutlet var profile1: UIImageView!
    @IBOutlet var profile2: UIImageView!
    @IBOutlet var profile3: UIImageView!
    @IBOutlet var organizationProfile: UIImageView!
    @IBOutlet var inviteButton: UIButton!
    @IBOutlet var goSelfButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var locationAdress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(latitude: -6.175392, longitude: 106.827153)
        //itu lattitude sama longitude monas, kaya buat default aja
        let region = MKCoordinateRegion (center: location , span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        let pin = customPin(pinTitle: "Monas", pinSubTitle: "Jakarta", location: location)
        locationAdress.text = "\(pin.getTitleName()) , \(pin.getSubTitleName()) "
        
        self.mapView.addAnnotation(pin)
        self.mapView.delegate = self
        
        profile1.layer.masksToBounds = true
        profile2.layer.masksToBounds = true
        profile3.layer.masksToBounds = true
        organizationProfile.layer.masksToBounds = true
        
        profile1.layer.cornerRadius = profile1.bounds.width / 2
        profile2.layer.cornerRadius = profile2.bounds.width / 2
        profile3.layer.cornerRadius = profile3.bounds.width / 2
        organizationProfile.layer.cornerRadius = organizationProfile.bounds.width / 2
        
        inviteButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        inviteButton.layer.borderWidth = 1
        goSelfButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        goSelfButton.layer.borderWidth = 1
        
        
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation title == \(String(describing:view.annotation?.title!))")
    }

}
    
    
}

