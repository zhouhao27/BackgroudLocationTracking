//
//  LogMgr.swift
//  Move
//
//  Created by Zhou Hao on 27/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation

class LogMgr {
  static let shared = LogMgr()
  var logger: Logger
  private var svc: LogSvcProtocol!
  
  private init() {
    svc = LogSvc()
    logger = Logger(svc: svc)
  }
  
  public func log(message: String, exception: String?,actionName: String, level: LogLevel, logger: String? = nil) {
  
    let appUserId = 1
    let userName = "ZH:"
    let deviceId = "12345"
    
    let log = Log()
    //log.thread = "\(Thread.current)"
    log.thread = "\(deviceId)"
    log.logger = userName
    log.actionName = actionName
    log.createdBy = 1
    log.level = level
    log.message = message
    log.exception = exception
    log.createDate = Date().timestamp()
    log.synced = 0
    log.deviceId = "\(deviceId)"

    self.logger.log(log)
  }
}
