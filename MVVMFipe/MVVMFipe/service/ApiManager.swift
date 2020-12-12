//
//  APIManager.swift
//  MVVMFipe
//
//  Created by Marcio P Ferreira on 10/12/20.
//

import Foundation
import Alamofire

class ApiManager {
    
    func loadBrands(onComplete: @escaping ([Brand]?) -> Void) {
        AF.request("\(Enviroment.baseUrl)/carros/marcas").responseJSON { response in
            if let json = response.value as? [[String: Any]] {
                var brands = [Brand]()
                for item in json {
                    brands.append(Brand(fromDictionary: item))
                }
                onComplete(brands)
                return
            }
            onComplete(nil)
        }
    }
    
    func loadModels(brandId: String, onComplete: @escaping ([Model]?) -> Void) {
        AF.request("\(Enviroment.baseUrl)/carros/marcas/\(brandId)/modelos").responseJSON { response in
            if let json = response.value as? [String: Any], let jsonModels = json["modelos"] as? [[String: Any]] {
                var models = [Model]()
                for item in jsonModels {
                    models.append(Model(fromDictionary: item))
                }
                onComplete(models)
                return
            }
            onComplete(nil)
        }
    }
}
