//
//  DataResponse.swift
//  PassportBoilerplate
//
//  Created by Attila Kis on 06/03/2016.
//  Copyright © 2016 Attila Kis. All rights reserved.
//

import UIKit
import ObjectMapper

class DataResponse: Response {
    
    var value: String?
    
    override func mapping(map: Map) {
        super.mapping(map)
        value <- map["value"]
    }
}
