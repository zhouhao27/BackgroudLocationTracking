//
//  Api.swift
//  Move
//
//  Created by Zhou Hao on 27/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation

struct Api {
  
  // MARK: - Base baseUrl
  
  static let http = "https://"
  static let host = "web-move-uat.lta.gov.sg"
  static let port = 443
  static let baseUrl = "\(http)\(host):\(port)/LTAMOVEAPI/api"
  static let webk = "7ADFA7CF-5F47-4BCC-9D58-F76060EB73E5"
  
  // API name
  static let logger = "\(baseUrl)/AppLogs/PostLogs"
  static let getDeviceId = "\(baseUrl)/CNFIG/GetDeviceByName"    
  static let login = "\(baseUrl)/Account/AuthenticateMobileUser"
  static let changePassword = "\(baseUrl)/Account/ChangeMobileUserPassword"
  static let user = "\(baseUrl)/ACCT/GetUsersByDeviceID"
  static let master = "\(baseUrl)/ENFC/GetMasterDataByDeviceID"
  static let masterRARL = "\(baseUrl)/RARL/GetMasterDataByDeviceID"
  static let masterDBC = "\(baseUrl)/DBC/GetMasterDataByDeviceID"
  
  static let masterAck = "\(baseUrl)/masterSynced"
  static let userAck = "\(baseUrl)/userSynced"
  static let userUpload = "\(baseUrl)/userUpload"
  static let timeSync = "\(baseUrl)/CNFIG/GetTimeStamp"  
  static let createENFViolation = "\(baseUrl)/ENFC/PostCase"
  static let dbcCreateReport = "\(baseUrl)/DBC/PostCase"
  static let rarlCreateReport = "\(baseUrl)/RARL/PostCase"
  
  // MARK: VRLS interface
  static let searchVehicleList = "\(baseUrl)/VRLS/getVehList"
  static let vehicleSearch = "\(baseUrl)/VRLS/getVehDetails"
  static let searchVehicleListWithNRIC = "\(baseUrl)/VRLS/getVehPABListByOwnerID"
  static let searchVehicleListWithSuffix = "\(baseUrl)/VRLS/checkVehSuffix"
  static let searchHVPInfo = "\(baseUrl)/VRLS/getHVPList"
  static let searchHVPDetails = "\(baseUrl)/VRLS/getHVPdetails"
  
  static let searchVPCInfo = "\(baseUrl)/VRLS/getVPCList"
  static let searchVPCDetails = "\(baseUrl)/VRLS/getVPCdetails"
  static let searchOffenceDetails = "\(baseUrl)/search/getOffenceDetails"

  // RARL
  static let searchOffenderList = "\(baseUrl)/RARL/GetOffendersList"

  static let deviceTokenRegister = "\(baseUrl)/DeviceToken"
  
  // Roaster (assigned task) Search
  static let searchAssignedTasks = "\(baseUrl)/CNFIG/GetAssignDuty"
  static let readAssignedTasks = "\(baseUrl)/CNFIG/PostAssignDuty"
  
  // Map Sync Server
  static let defaultMapSyncUrl = "http://localhost:4000"
  
  // API key
  struct Key {
    static let deviceId = "deviceId"
    static let enfVoilation = "ENFCases"
    static let dbcReport = "DBCReport"
  }
}
