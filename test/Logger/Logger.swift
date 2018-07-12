//
//  Logger.swift
//  Move
//
//  Created by Zhou Hao on 16/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation

public enum LogLevel: String {
  case info
  case error
}

class Logger {
  
  private var svc: LogSvcProtocol!
  
  init(svc: LogSvcProtocol) {
    self.svc = svc
  }

  func log(_ log: Log) {
    do {
      
      // save to server
      svc.log([log], complete: { (success) in
        if success {
          // update sync flag
          do {
          } catch {
            
          }
        }
      })
    } catch {
      // TODO: can't log
    }
  }  
}
