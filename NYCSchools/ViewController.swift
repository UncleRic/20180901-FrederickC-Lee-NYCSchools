//
//  ViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

let urlString = "https://data.cityofnewyork.us/Education/2017-DOE-High-School-Directory/s3k6-pzi2/data"

class ViewController: UIViewController {

    var url = URL(string: urlString)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // ----------------------------------------------------------------------------------
    
    @IBAction func DoSomething(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func exitAction(_ sender: Any) {
        exit(0)
    }
    
}

