//
//  ViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

let urlString = "https://data.cityofnewyork.us/resource/734v-jeq5.json"

class ViewController: UIViewController {

    var url = URL(string: urlString)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // ----------------------------------------------------------------------------------
    
    func getData() {
        URLSession.shared.dataTask(with: url!) { data, _, error in
            let dataString = String(data: data!, encoding: .ascii)
            
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

