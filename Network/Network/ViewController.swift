//
//  ViewController.swift
//  Network
//
//  Created by Marcio P Ferreira on 11/11/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDataAlamofire()
        //loadDataSession()
        
    }

    func loadDataAlamofire() {
        AF.request("https://api/api/breeds/image/random").responseJSON { response in
            if let dictionary = response.value as? [String: Any] {
                print(dictionary)
            }
        }
    }
    
    func loadDataAlamofire2() {
        AF.request("https://dog.ceo/api/breeds/image/random").responseJSON { response in
            if let dictionary = response.value as? [String: Any] {
                print(dictionary)
            }
        }
    }
    
    func loadDataSession() {
            var request = URLRequest(url: URL(string: "https://dog.ceo/api/breeds/image/random")!, timeoutInterval: Double.infinity)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // try to read out a string array
                        if let names = json["message"] as? String {
                            print(names)
                        }
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }

                DispatchQueue.main.async {
                    self.showData(line: String(data: data, encoding: .utf8)!)
                }
            }

            task.resume()
        }

        func showData(line: String) {
            print(line)
        }

}

