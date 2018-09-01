//
//  SchoolViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
//

import UIKit

class SchoolViewController: UIViewController {

    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    
    var schoolData: School?
    
    override func viewWillAppear(_ animated: Bool) {
        schoolLabel.text = schoolData!.schoolName
        readingLabel.text = "Critcal Reading Avg Score: \(schoolData!.satCriticalReadingAvgScore)"
        mathLabel.text = "Math Avg Score: \(schoolData!.satMathAvgScore)"
        writingLabel.text = "Writing Avg Score: \(schoolData!.satWritingAvgScore)"
    }


}
