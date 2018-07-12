//
//  Keys.swift
//  Move
//
//  Created by Zhou Hao on 13/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation

struct Keys {
  static let deviceId = "DeviceId"
  static let moduleNo = "ModuleNo"
  static let departmentId = "DepartmentId"
  static let noNeedToChangePassword = "NoNeedToChangePassword"
  static let isLocked = "PhoneIsLocked"
  static let numOfRetires = "NumberOfRetires"
  static let lastMasterSyncTimestamp = "TimeStampForLastMasterSync"
  static let lastCredentialSyncTimestamp = "TimeStampForLastCredentialSync"
  static let lastCredentialUploadSyncTimestamp = "TimeStampForLastCredentialUploadSync"
  static let lastMapSyncTimestamp = "TimeStampForLastMapSync"
  static let lastConfigSyncTimestamp = "TimeStampForLastConfigSync"
  static let lastTimeSyncTimestamp = "TimeStampForTimeSync"
  static let lastHouseKeepingTimeStamp = "TimeStampForHouseKeeping"
  static let timeDifference = "TimeDifferenceBetweenServerAndClient"
  static let mapDataPopulated = "MapDataPopulated"
  static let lastMasterSyncDate = "MasterSyncTimestamp"
  static let apnsToken = "Token"  // token from APNS
  
  // for running number
  static let lastRunningNumber = "LastRunningNumber"     
  
  // notification keys
  static let notifInactivity = "TimeOutUserInteraction"
  static let notifJailbreak = "DeviceJailbreak"
  
//  static let notifPasswordExpiry1stWarning = "FirstWarningForPasswordExpiry"
//  static let notifPasswordExpiry2ndWarning = "SecondWarningForPasswordExpiry"
//  static let notifPasswordExpired = "PasswordExpired"
//  static let notifAPNSTokenReceived = "TokenReceived"
  
  // https header 
  static let authKey = "WEB_API_AUTH_KEY"
  
  // MARK: - map sync url
  // MARK: last used map sync url
  static let lastMapSyncUrl = "lastMapSyncUrl"
}
