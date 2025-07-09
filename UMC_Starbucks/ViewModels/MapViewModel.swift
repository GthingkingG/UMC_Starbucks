//
//  MapViewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 7/2/25.
//

import SwiftUI
import MapKit
import Observation

@Observable
final class MapViewModel {
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var currentMapCenter: CLLocationCoordinate2D?
    
    
}
