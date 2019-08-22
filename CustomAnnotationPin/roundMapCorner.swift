//
//  roundMapCorner.swift
//  CustomAnnotationPin
//
//  Created by Benjamin Purbowasito on 22/08/19.
//  Copyright © 2019 iosda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class roundMapCorner: MKMapView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
        
    }
   
}
