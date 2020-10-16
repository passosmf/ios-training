//
//  ViewController.swift
//  Cities
//
//  Created by Marcio P Ferreira on 15/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var cities = [City]()
    var countries = [String]()
    var states = [String]()
    var filteredCities = [City]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var picker2: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        picker2.delegate = self
        picker2.dataSource = self
        
        cities.append(City(name: "São Paulo", state: "São Paulo", country: "BR", population: 200000000, temperature: 22.0, long: -46.634926, lat: -23.550240))
        cities.append(City(name: "Santos", state: "São Paulo", country: "BR", population: 200000000, temperature: 22.0, long: -46.328020, lat: -23.967925))
        cities.append(City(name: "Guarujá", state: "São Paulo", country: "BR", population: 200000000, temperature: 22.0, long: -46.255983, lat: -23.995094))
        
        cities.append(City(name: "Salvador", state: "Bahia", country: "BR", population: 200000000, temperature: 28.0, long: -38.506770, lat: -12.977879))
        cities.append(City(name: "Feira de Santana", state: "Bahia", country: "BR", population: 200000000, temperature: 29.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Lauro de Freitas", state: "Bahia", country: "BR", population: 200000000, temperature: 30.0, long: -23.550240, lat: -46.634926))
        
        cities.append(City(name: "Miami", state: "Florida", country: "US", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Monroe", state: "Florida", country: "US", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Palm Beach", state: "Florida", country: "US", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        
        cities.append(City(name: "Los Angeles", state: "Califórnia", country: "US", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Berkeley", state: "Califórnia", country: "US", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Pasadena", state: "Califórnia", country: "US", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        
        cities.append(City(name: "Winchester", state: "Hampshire", country: "EN", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Rushmoor", state: "Hampshire", country: "EN", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "New Forest", state: "Hampshire", country: "EN", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        
        cities.append(City(name: "Harlow", state: "Essex", country: "EN", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Rochford", state: "Essex", country: "EN", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        cities.append(City(name: "Colchester", state: "Essex", country: "EN", population: 200000000, temperature: 22.0, long: -23.550240, lat: -46.634926))
        
        filteredCities = cities
        
        states.append("Todos")
        countries.append("Todos")
        
        for city in cities {
            if !countries.contains(city.country) {
                countries.append(city.country)
            }
            if !states.contains(city.state) {
                states.append(city.state)
            }
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCities = cities

        if searchText.isEmpty == false {
            filteredCities = cities.filter({ $0.name.contains(searchText) || $0.state.contains(searchText) })
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cityDetail = UIStoryboard(name: "CityDetail", bundle: nil).instantiateInitialViewController() as? CityDetailViewController {
           cityDetail.city = filteredCities[indexPath.row]
           present(cityDetail, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filteredCities[indexPath.row].name + " - " + filteredCities[indexPath.row].state + " - " + filteredCities[indexPath.row].country
        return cell
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            if row == 0 {
                filteredCities = cities
            } else {
                filteredCities = cities.filter({ $0.state.contains(states[row]) })
            }
        }
        if component == 1 {
            if row == 0 {
                filteredCities = cities
            } else {
                filteredCities = cities.filter({ $0.country.contains(countries[row]) })
            }
        }
        tableView.reloadData()
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return states.count
        }
        if component == 1 {
            return countries.count
        }
        return countries.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return states[row]
        }
        if component == 1 {
            return countries[row]
        }
        return countries[row]
    }
}
