//
//  LocationManager.swift
//  UMC_Starbucks
//
//  Created by Air on 7/2/25.
//

import Foundation
import CoreLocation
import MapKit
import Observation

@Observable
class LocationManager: NSObject {
    static let shared = LocationManager()
    
    //MARK: CLLocationManager
    private let locationManager = CLLocationManager()
    
    //MARK: Published Properties
    var currentLocation: CLLocation?
    var currentHeading: CLHeading?
    
    var currentSpeed: CLLocationSpeed = 0
    var currentDirection: CLLocationDirection = 0
    
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var didEnterGeofence: Bool = false
    
    //MARK: Init
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.headingFilter = kCLHeadingFilterNone
        
        requestAuthorization()
        startUpdatingLocation()
        startUpdatingHeading()
    }
    
    //MARK: 권한 요청
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func startUpdatingHeading() {
        locationManager.startUpdatingHeading()
    }
    
    func stopUpdatingHeading() {
        locationManager.stopUpdatingHeading()
    }
    
    //MARK: 큰 거리 이동
    func startMonitoringSignificantLocationChanges() {
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func stopMonitoringSignificantLocationChanges() {
        locationManager.stopMonitoringSignificantLocationChanges()
    }
    
    //MARK: 방문 감지
    func startMonitoringVisits() {
        locationManager.startMonitoringVisits()
    }
    
    //MARK: 지오펜싱
    func startMonitoringGeofence(center: CLLocationCoordinate2D, radius: CLLocationDistance, identifier: String) {
        let region = CLCircularRegion(center: center, radius: radius, identifier: identifier)
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        locationManager.startMonitoring(for: region)
    }
    
    func stopMonitoringAllGeofences() {
        for region in locationManager.monitoredRegions {
            locationManager.stopMonitoring(for: region)
        }
    }
}

//MARK: CLLocationDelegate
extension LocationManager: CLLocationManagerDelegate {
    //MARK: 권한 변경 감지
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    //MARK: 위치 업데이트 감지
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let latest = locations.last {
            DispatchQueue.main.async {
                self.currentLocation = latest
                self.currentSpeed = max(latest.speed, 0)
            }
        }
    }
    
    //MARK: 방향 감지
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        DispatchQueue.main.async {
            self.currentHeading = newHeading
            self.currentDirection = newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading
        }
    }
    
    //MARK: 방문 감지
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        print("방문 감지 - 좌표: \(visit.coordinate), 도착: \(visit.arrivalDate), 출발: \(visit.departureDate)")
    }
    
    //MARK: 지오펜싱: 진입
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        DispatchQueue.main.async {
            self.didEnterGeofence = true
        }
    }
    
    //MARK: 지오펜싱: 이탈
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        DispatchQueue.main.async {
            self.didEnterGeofence = false
        }
    }
    
    //MARK: 오류 처리
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 오류: \(error.localizedDescription)")
    }
}

extension CLLocation {
    func distance(location: CLLocation) -> Double {
        return self.distance(from: location)/1000
    }
}
