//
//  CityDetailViewController.swift
//  Cities
//
//  Created by Marcio P Ferreira on 16/10/20.
//

import UIKit
import MapKit

class CityDetailViewController: UIViewController {

    var city: City?
    
    @IBOutlet weak var labelCityName: UILabel!
    
    @IBOutlet weak var labelStateName: UILabel!
    
    @IBOutlet weak var labelCountryName: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let city = city {
            labelCityName.text = city.name
            labelStateName.text = city.state
            labelCountryName.text = city.country
            
            let initialLocation = CLLocation(latitude: city.lat, longitude: city.long)
            mapView.centerToLocation(initialLocation)
        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 7000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
