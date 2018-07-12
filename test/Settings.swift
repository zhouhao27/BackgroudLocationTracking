//
//  Settings.swift
//  BackgroundTask
//
//  Created by Zhou Hao on 5/7/18.
//  Copyright © 2018 Yaro. All rights reserved.
//

import Foundation
import UIKit

struct Settings {
  
  // MARK: - Image compression
  // MARK: low
  //  static let ratioOfImageCompress = 0.25
  //  static let imageQuality: CGFloat = 0.5
  //  static let maxImageQuality: CGFloat = 0.4
  //  static let targetImageFileSize: CGFloat = 0.05
  
  // MARK: medium
  static let ratioOfImageCompress = 0.45
  static let imageQuality: CGFloat = 0.40
  static let targetWidth: CGFloat = 1300
  static let maxImageQuality: CGFloat = 1
  static let targetImageFileSize: CGFloat = 0.40
  
  static let maxLoginRetries = 6
  static let idleTime = 20 * 60
  static let idleTimeFrequency = 10
  static let numberOfDifferentPassword = 3
  
  static let defaultRequestTimeout = 30
  
  static let maxEnfOffences = 5
  static let maxPhotosAllowed = 10 // for RARL and ENF, there is no limitation for DBC
  
  static let minSearchKeyLength = 3
  static let minHVPSearchKeyLength = 1
  
  static let dateFormat = "dd/MM/yyyy"
  
  // Navigation title font size
  static let navigationFontSize: CGFloat = 18
  
  // Segment Tab
  static let segmentTabFontSize: CGFloat = 18
  
  // For schedule and synchronization
  static let timerResolution: Int64 = 15 * 60 // 15 minutes
  static let masterSyncFreqency: Int64 = 60 * 60 * 24  // 24 hours
  static let credentialSyncFreqency: Int64 = 60 * 60 * 24
  static let configSyncFreqency: Int64 = 60 * 60 * 24
  static let mapSyncFreqency: Int64 = 60 * 60 * 24
  static let timeSyncFreqency: Int64 = 60 * 60 * 3
  static let houseKeepingFreqency: Int64 = 60 * 60 * 3 // every two hours check once
  
  static let passwordExpiryDuration: Int64 = 60 * 60 * 24 * 90
  static let passwordExpiryFirstWarning: Int64 = 60 * 60 * 24 * 70
  static let passwordExpirySecondWarning: Int64 = 60 * 60 * 24 * 80
  
  static let systemId = 5 // if not logged in, use this id
  static let systemLogger = "mobile"
  static let dueDate = 3
  static let sentDueDate = 1
  
  // house keeping
  static let draftKeepDuration: Int64 = 3 * 60 * 60 * 24  // 3 day
  static let sentKeepDuration: Int64 = 1 * 60 * 60 * 24   // 1 days
  static let logKeepDuration: Int64 = 30 * 60 * 60 * 24
  static let imageKeepDuration: Int64 = 30 * 60 * 60 * 24
  
  // map
  static let reverseSearchRange = 100.0
  static let initialZoomLevel = 14
  static let miniZoomLevel = 11
  static let maxZoomLevel = 20
  
  //Photo Caption
  static let photoCaption = 150
  static let vehicleDescription = 150
  static let vehicleNo = 13
  
  // Gallery page size
  static let galleryPageSize = 32
  
}
