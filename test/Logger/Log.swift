//
//  Log.swift
//  Move
//
//  Created by Zhou Hao on 16/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation
import ObjectMapper

class Log: Mappable {
  
  static let FID_ID = "APP_LOG_NUM"
  static let FID_THREAD = "THREAD_TXT"
  static let FID_LEVEL = "LEVEL_TXT"
  static let FID_MSG = "MSG_TXT"
  //PENTEST JB - changet the field name from CRT_DTTM to CRT_DTTM_STAMP
  static let FID_CREATEDATE = "CRT_DTTM_STAMP"
  static let FID_DEVICENO = "DVCE_NUM"
  static let FID_CREATEDBY = "CRT_BY_NUM"
  static let FID_LOGGER = "LOGR_TXT"
  static let FID_ACTION = "ACT_NAM"
  static let FID_EXCEPTION = "EXCP_TXT"
  static let FID_SYNCED = "LOG_SYNC"
  
  var id: Int64 = 0           // no need to send to server
  var thread: String = ""
  var level: LogLevel = .info
  var logger: String = ""
  var actionName: String = ""
  var message: String = ""
  var exception: String?
  var createDate: Int64 = 0
  var createdBy: Int = 0      // app user id
  var deviceId: String = ""
  var synced: Int = 0         // no need to send to server
  
  init() {
  }
  
  convenience required init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    thread <- map[Log.FID_THREAD]
    level <- map[Log.FID_LEVEL]
    logger <- map[Log.FID_LOGGER]
    actionName <- map[Log.FID_ACTION]
    message <- map[Log.FID_MSG]
    exception <- map[Log.FID_EXCEPTION]
    createDate <- map[Log.FID_CREATEDATE]
    createdBy <- map[Log.FID_CREATEDBY]
    //synced <- map[Log.FID_SYNCED]
    deviceId <- map[Log.FID_DEVICENO]
  }
}

