//
//  Dog.swift
//  Network
//
//  Created by Marcio P Ferreira on 11/11/20.
//

import Foundation

class Dog  {
    var message: String!
    var status: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        message = dictionary["message"] as? String
        status = dictionary["status"] as? String
        
    }
}
