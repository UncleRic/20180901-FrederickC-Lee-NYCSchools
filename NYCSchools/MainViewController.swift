//  MainViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
// ----------------------------------------------------------------------------------

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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          left: view.safeAreaLayoutGuide.leftAnchor,
                          right: view.safeAreaLayoutGuide.rightAnchor,
                          centerYAnchor: nil,
                          centerXAnchor: nil,
                          paddingTop: 0,
                          paddingLeft: 0,
                          paddingBottom: -60,
                          paddingRight: 0, width: 0, height: 0)
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
    
    // MARK: - Action Methods
    
    @IBAction func DoSomething(_ sender: UIBarButtonItem) {
        getData()
        return
    }
    
    @IBAction func exitAction(_ sender: Any) {
        exit(0)
    }
}

// ============================================================================================

// MARK: -

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataDict.count
    }
    
    func pickerView(_: UIPickerView,
                    viewForRow row: Int,
                    forComponent _: Int,
                    reusing _: UIView?) -> UIView {
        let myLabel: UILabel = {
            let label = UILabel()
            label.text = dataDict[row].schoolName
            label.textColor = UIColor.purple
            label.font = UIFont(name: "Georgia", size: 18.0)
            label.textAlignment = .center
            return label
        }()
        
        return myLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
        performSegue(withIdentifier: Segue.kSchool, sender: self)
    }
}
