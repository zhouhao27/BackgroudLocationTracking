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
  static let http = "http://"
  static let host = "localhost"
  static let port = 80
  static let baseUrl = "\(http)\(host):\(port)/test/api"
  static let webk = "7ADFA7CF-5F47-4BCC-9D58-F76060EB73E5"

  
  // API name
  static let logger = "\(baseUrl)/AppLogs/PostLogs"
}
