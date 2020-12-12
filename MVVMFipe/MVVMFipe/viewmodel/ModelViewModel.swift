//
//  ModelViewModel.swift
//  MVVMFipe
//
//  Created by Marcio P Ferreira on 11/12/20.
//

import Foundation

class ModelViewModel {
    
    var arrayModels = [Model]()
    
    var selectedBrand: Brand?
    
    private var apiManager: ApiManager?
    
    var isLoading: Bool = false {
        didSet { } //self.updateLoadingStatus?() }
    }
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func loadModels(brandId: String, onComplete: @escaping (_ success: Bool) -> Void) {
        self.apiManager?.loadModels(brandId: brandId, onComplete: { (models) in
            //self.isLoading = false
            if let modelsList = models {
                self.arrayModels = modelsList
                onComplete(true)
                return
            }
            onComplete(false)
        })
    }
    
    func getModelsRowsNumber() -> Int {
        return self.arrayModels.count
    }
}
