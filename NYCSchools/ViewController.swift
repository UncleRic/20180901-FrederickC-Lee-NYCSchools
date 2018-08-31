//
//  ViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

let urlString = "https://data.cityofnewyork.us/resource/734v-jeq5.json"

public struct School: Codable {
    let dbn: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_writing_avg_score: String
    let school_name: String
}

class ViewController: UIViewController {

    var url = URL(string: urlString)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // ----------------------------------------------------------------------------------
    
    func getData() {
        URLSession.shared.dataTask(with: url!) { data, _, error in
        
            do {
                let dataDict = try JSONDecoder().decode([School].self, from: data!)
                print(dataDict)
            } catch (let error) {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async { [weak self] in
                if let msg = error?.localizedDescription {
                    let title = "Network Error"
                    let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
                    let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(dismissAction)
                    self?.present(alertController, animated: true, completion: nil)
                } else {
                    // ... use transform() to generate a message back to the state.
                   print("Success")
                }
            }
            }.resume()
    }

    // ----------------------------------------------------------------------------------
    
    @IBAction func DoSomething(_ sender: UIBarButtonItem) {
        getData()
        return
    }
    
    @IBAction func exitAction(_ sender: Any) {
        exit(0)
    }
    
}

