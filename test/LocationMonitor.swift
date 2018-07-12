//
//  LocationMonitor.swift
//  Move
//
//  Created by Zhou Hao on 23/11/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation
import MapKit

class LocationMonitor: NSObject {
  static let shared = LocationMonitor()
  
  private var locationManager: CLLocationManager!
  var lastLocation: CLLocation?
  var status = CLAuthorizationStatus.notDetermined
  var isRealtime = false
  typealias LocationCallback = (_ success:Bool, _ location:CLLocation) -> ()
  var locationCallback: LocationCallback?
  
  override init() {
    super.init()
    
    locationManager = CLLocationManager()
    locationManager.delegate = self 
    locationManager.allowsBackgroundLocationUpdates = true
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.activityType = .automotiveNavigation
    locationManager.distanceFilter = 5
  }
  
  func requestAccess() {    
    locationManager.requestAlwaysAuthorization()
    locationManager.requestWhenInUseAuthorization()
  }
  
  func startUpdateLocation(complete: @escaping LocationCallback) {
    
    locationManager.startUpdatingLocation()
    self.locationCallback = complete
  }
  
  func stopUpdateLocation() {
    self.locationCallback = nil
    locationManager.stopUpdatingLocation()
  }
}

extension LocationMonitor: CLLocationManagerDelegate {
  
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if locations.count > 0 {
      // get the nearest location
      lastLocation = locations.sorted { $0.horizontalAccuracy < $1.horizontalAccuracy }.first
      self.locationCallback?(true, lastLocation!)
      if !isRealtime {
        stopUpdateLocation()
      }
    }
  }
  
  public func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
    
    updateLastLocation()    
  }
  
  public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse {
      self.status = status
    }
  }
  
  func updateLastLocation() {
    if let location = lastLocation {
      self.locationCallback?(false, location)
    } else {
      self.locationCallback?(false, CLLocation())
    }
  }
  
}
