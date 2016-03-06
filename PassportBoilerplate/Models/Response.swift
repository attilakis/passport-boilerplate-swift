//
//  Response.swift
//  PassportBoilerplate
//
//  Created by Attila Kis on 06/03/2016.
//  Copyright © 2016 Attila Kis. All rights reserved.
//

import UIKit
import ObjectMapper

class Response: Mappable {
    
    var success: Bool?
    var message: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
    }
}