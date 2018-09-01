//
//  MainViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

let urlString = "https://data.cityofnewyork.us/resource/734v-jeq5.json?$order=school_name"

struct Segue {
    static let kSchool = "ShowSchool"
}

public struct School: Codable {
    let numOfSatTestTakers: String
    let satCriticalReadingAvgScore: String
    let satMathAvgScore: String
    let satWritingAvgScore: String
    let schoolName: String
}

class MainViewController: UIViewController {
    @IBOutlet var pickerView: UIPickerView!
    
    var url = URL(string: urlString)
    var dataDict: [School] = []
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // ----------------------------------------------------------------------------------
    
    func getData() {
        URLSession.shared.dataTask(with: url!) { data, _, error in
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                self.dataDict = try decoder.decode([School].self, from: data!)
            } catch let error {
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
                    self!.pickerView.reloadAllComponents()
                    let schoolName = self!.dataDict[1].schoolName
                    print("School Name: \(schoolName)")
                    print("Success")
                }
            }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "ShowSchool" {
            if let schoolVC = (segue.destination as? SchoolViewController) {
                schoolVC.schoolData = dataDict[row]
            }
        }
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

// ============================================================================================

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataDict.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataDict[row].schoolName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
        performSegue(withIdentifier: Segue.kSchool, sender: self)
    }
}
