//
//  Place.swift
//  UMC_Starbucks
//
//  Created by Air on 8/6/25.
//

import Foundation
import MapKit

struct Place: Identifiable {
    var id = UUID()
    var mapItem: MKMapItem
}
