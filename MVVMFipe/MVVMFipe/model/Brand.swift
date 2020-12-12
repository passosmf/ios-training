//
//  Brand.swift
//  MVVMFipe
//
//  Created by Marcio P Ferreira on 11/12/20.
//

import Foundation

class Brand: NSObject {
    
    var id: String!
    var name: String!

    init(fromDictionary dictionary: [String: Any]) {
        id = dictionary["codigo"] as? String
        name = dictionary["nome"] as? String

        if id == nil {
            if let intId = dictionary["codigo"] as? Int {
                id = "\(intId)"
            }
        }
    }
}
