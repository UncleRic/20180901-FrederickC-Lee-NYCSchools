//
//  MainViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

let urlString = "https://data.cityofnewyork.us/resource/734v-jeq5.json"

public struct School: Codable {
    //let dbn: String
    let numOfSatTestTakers: String
    let satCriticalReadingAvgScore: String
    let satWritingAvgScore: String
    let schoolName: String
}

class MainViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var url = URL(string: urlString)
    var dataDict:[School] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func viewDidLayoutSubviews() {
//        pickerView.reloadAllComponents()
//    }
//
    // ----------------------------------------------------------------------------------
    
    func getData() {
        URLSession.shared.dataTask(with: url!) { data, _, error in
        
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                self.dataDict = try decoder.decode([School].self, from: data!)
                print(self.dataDict)
                
                let schoolName = self.dataDict[1].schoolName
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
                self!.pickerView.reloadAllComponents()
                let schoolName = self!.dataDict[1].schoolName
                    print("School Name: \(schoolName)")
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
    
    
}

