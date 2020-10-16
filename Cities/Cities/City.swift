//
//  City.swift
//  Cities
//
//  Created by Marcio P Ferreira on 15/10/20.
//

import Foundation

class City {
    var name: String
    var state: String
    var country: String
    var population: Int
    var temperature: Double
    var long: Double
    var lat: Double
    
    init(name: String, state: String, country: String, population: Int, temperature: Double, long: Double, lat: Double) {
        self.name = name
        self.state = state
        self.country = country
        self.population = population
        self.temperature = temperature
        self.long = long
        self.lat = lat
    }
    
}
