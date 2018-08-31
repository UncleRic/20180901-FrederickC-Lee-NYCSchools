//
//  ViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

let urlString = "https://data.cityofnewyork.us/resource/734v-jeq5.json"


let dataSource1 = """
{
"dbn" : "01M292",
"num_of_sat_test_takers" : "29",
"sat_critical_reading_avg_score" : "355",
"sat_math_avg_score" : "404",
"sat_writing_avg_score" : "363",
"school_name" : "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES"
}
""".data(using: .utf8)

let dataSource = """
[{
"dbn" : "01M292",
"num_of_sat_test_takers" : "29",
"sat_critical_reading_avg_score" : "355",
"sat_math_avg_score" : "404",
"sat_writing_avg_score" : "363",
"school_name" : "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES"
},
{
"dbn" : "79Q950",
"num_of_sat_test_takers" : "8",
"sat_critical_reading_avg_score" : "496",
"sat_math_avg_score" : "400",
"sat_writing_avg_score" : "426",
"school_name" : "GED PLUS s CITYWIDE"
},
{
"dbn" : "79X490",
"num_of_sat_test_takers" : "9",
"sat_critical_reading_avg_score" : "367",
"sat_math_avg_score" : "370",
"sat_writing_avg_score" : "360",
"school_name" : "PHOENIX ACADEMY"
}]
""".data(using: .utf8)

// -------------------------

public struct School: Codable {
    let dbn: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_writing_avg_score: String
    let school_name: String
}

public struct SchoolModel: Codable {
    let schools: [School]
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
          //  let dataString = String(data: dataSource1!, encoding: .ascii)
            do {
                let dataDict = try JSONDecoder().decode([School].self, from: dataSource!)
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

