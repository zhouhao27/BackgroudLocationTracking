//
//  LogSvcProtocol.swift
//  Move
//
//  Created by Zhou Hao on 27/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation

protocol LogSvcProtocol {
  func log(_ logs: [Log], complete:@escaping (Bool)->())  // log to server
}
