//
//  ViewController.swift
//  test
//
//  Created by Yaro on 8/26/16.
//  Copyright © 2016 Yaro. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import CoreLocation

extension Double {
  func format(f: String) -> String {
    return String(format: "%.\(f)f",self)
  }
}

extension Date {
  public func toString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MMM-yyyy, HH:mm:ss"
    return formatter.string(from: self)
  }
  
  public func timestamp() -> Int64 {
    return Int64(self.timeIntervalSince1970) 
  }
}

class AlamofireManager {
  
  static let shared = AlamofireManager()
  var manager: SessionManager!
  
  private init() {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = TimeInterval(Settings.defaultRequestTimeout)
    configuration.timeoutIntervalForResource = TimeInterval(Settings.defaultRequestTimeout)
    
    var headers = Alamofire.SessionManager.defaultHTTPHeaders
    headers[Keys.authKey] = Api.webk
    configuration.httpAdditionalHeaders = headers
    self.manager = Alamofire.SessionManager(configuration: configuration)
  }
  
}

class ViewController: UIViewController {
    
  @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var starTaskButton: UIButton!
    @IBOutlet weak var stopTaskButton: UIButton!
    
  var timer = Timer()
  var backgroundTask = BackgroundTask()
  var lastMessage = ""
  var lastLocation = CLLocation()
  var currentLocation = CLLocation()
    
  @IBAction func startBackgroundTask(_ sender: AnyObject) {
    backgroundTask.startBackgroundTask()
    //timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
    starTaskButton.alpha = 0.5
    starTaskButton.isUserInteractionEnabled = false
    
    stopTaskButton.alpha = 1
    stopTaskButton.isUserInteractionEnabled = true
    
    LocationMonitor.shared.isRealtime = true
    LocationMonitor.shared.startUpdateLocation { (success, location) in
      if success {
        self.lastLocation = self.currentLocation
        self.currentLocation = location
        let message = self.generateMessage()
        self.lblLocation.text = message
        self.post(message: message)
      }
    }
  }
  
  @IBAction func stopBackgroundTask(_ sender: AnyObject) {
    starTaskButton.alpha = 1
    starTaskButton.isUserInteractionEnabled = true
    stopTaskButton.alpha = 0.5
    stopTaskButton.isUserInteractionEnabled = false
    
    //timer.invalidate()
    backgroundTask.stopBackgroundTask()
    label.text = ""
    
    LocationMonitor.shared.stopUpdateLocation()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stopTaskButton.alpha = 0.5
    stopTaskButton.isUserInteractionEnabled = false
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.label.text = lastMessage
  }
    
  func timerAction() {
    label.text = lastMessage
    post(message: generateMessage())
  }
  
  func post(message: String) {

    print("Post to server")
    
//    let message = "(\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)) distance=\() accuracy=\(currentLocation.horizontalAccuracy):\(Date().toString())"
    LogMgr.shared.log(message: message, exception: nil, actionName: "BackgroundTask", level: .info, logger: "ZH")
    
/*
    LocationMonitor.shared.startUpdateLocation { (success, location) in
      if success {
        let message = "(\(location.coordinate.latitude),\(location.coordinate.longitude)):\(Date())"
        
        self.lastMessage = message
        
        LogMgr.shared.log(message: message, exception: nil, actionName: "BackgroundTask", level: .info, logger: "ZH")
      } else {
        
        let message = "(Failed to get location : \(Date())"
        
        self.lastMessage = message
        LogMgr.shared.log(message: message, exception: nil, actionName: "BackgroundTask", level: .info, logger: "ZH")
      }
    }
*/

  }
  
  func generateMessage() -> String {
    let locationAge = Double(-currentLocation.timestamp.timeIntervalSinceNow).format(f: "03")
    let distance = Double(lastLocation.distance(from: currentLocation)).format(f: "03")
    let lat = currentLocation.coordinate.latitude
    let long = currentLocation.coordinate.longitude
    let message = "location=(\(lat),\(long))\ndistance=\(distance)\naccuracy=\(currentLocation.horizontalAccuracy)\nlocation age=\(locationAge)\nat \(Date().toString())"
    return message
  }
}


