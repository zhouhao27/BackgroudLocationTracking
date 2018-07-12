//
//  LogSvc.swift
//  Move
//
//  Created by Zhou Hao on 27/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import Foundation
import Alamofire

class LogSvc: LogSvcProtocol {
  func log(_ logs: [Log], complete:@escaping (Bool)->()) {
    let all = logs.map { $0.toJSON() }
    
    //print(all.toJSONString())
    //print(Api.logger)
    
    AlamofireManager.shared.manager.request(Api.logger, method: .post, parameters: all.asParameters(), encoding: ArrayEncoding()).responseJSON {
      response in
      
      switch response.result {
      case .success:
        //SwiftyBeaver.self.debug(response)
        complete(true)
      case .failure(let error):
        //SwiftyBeaver.self.error(error)
        complete(false)
      }
    }
  }
}
