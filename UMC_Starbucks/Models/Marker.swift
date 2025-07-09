//
//  Marker.swift
//  UMC_Starbucks
//
//  Created by Air on 7/2/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
