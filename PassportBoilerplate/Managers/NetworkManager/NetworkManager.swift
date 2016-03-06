//
//  NetworkManager.swift
//  PassportBoilerplate
//
//  Created by Attila Kis on 06/03/2016.
//  Copyright © 2016 Attila Kis. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class NetworkManager {
    
    static let sharedManager = NetworkManager()
    
    let manager = Alamofire.Manager(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    // Actions
    
    func login(username: String, password: String, completion: (success: Bool, response: Response?) -> Void) {
        
        let parameters = [
            "username": username,
            "password": password
        ]
        
        self.post("auth/login", parameters: parameters, completion: completion)
    }
    
    func register(username: String, password: String, completion: (success: Bool, response: Response?) -> Void) {
        
        let parameters = [
            "username": username,
            "password": password
        ]
        
        self.post("user/register", parameters: parameters, completion: completion)
    }
    
    func logout(completion: (success: Bool, response: Response?) -> Void) {
        self.get("auth/logout", completion: completion)
    }
    
    func getData(completion: (success: Bool, response: DataResponse?) -> Void) {
        self.get("api/data", completion: completion)
    }
    
    // Generic network actions
    
    func get<T: Mappable>(action: String, completion: (success: Bool, response: T?) -> Void) {
        
        manager.request(.GET, "\(Constants.HOST):\(Constants.PORT)/\(action)").responseObject { (response) -> Void in
            completion(success: response.result.isSuccess, response: response.result.value)
        }
    }
    
    func post<T: Mappable>(action: String, parameters: [String: AnyObject]? = nil, completion: (success: Bool, response: T?) -> Void) {
        
        manager.request(.POST, "\(Constants.HOST):\(Constants.PORT)/\(action)", parameters: parameters).responseObject { (response) -> Void in
            completion(success: response.result.isSuccess, response: response.result.value)
        }
    }
    
}
