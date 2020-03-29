//
//  PlaceMarker.swift
//  addBlog
//
//  Created by aietmac9 on 01/02/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class PlaceMarker: GMSMarker {
    let place: GooglePlace
    init(place: GooglePlace){
        self.place = place
        super.init()
        position = place.coordinate
        icon = UIImage(named: place.placeType+"_pin")
        groundAnchor = CGPoint(x: 0.5,y: 1)
        appearAnimation = .pop
    }
}
