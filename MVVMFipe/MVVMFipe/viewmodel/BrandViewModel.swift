//
//  BrandViewModel.swift
//  MVVMFipe
//
//  Created by Marcio P Ferreira on 11/12/20.
//

import Foundation

class BrandViewModel {
    
    var arrayBrands = [Brand]()
    
    private var apiManager: ApiManager?
    
    var isLoading: Bool = false {
        didSet { } //self.updateLoadingStatus?() }
    }
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func loadBrands(onComplete: @escaping (_ success: Bool) -> Void) {
        self.apiManager?.loadBrands(onComplete: { (brands) in
            //self.isLoading = false
            if let brandsList = brands {
                self.arrayBrands = brandsList
                onComplete(true)
                return
            }
            onComplete(false)
        })
    }
    
    func getBrandRowsNumber() -> Int {
        return self.arrayBrands.count
    }
}
