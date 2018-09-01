//  SchoolViewController.swift
//  NYCSchools
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
// ----------------------------------------------------------------------------------

import UIKit

class SchoolViewController: UIViewController {
    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var readingLabel: UILabel!
    @IBOutlet var mathLabel: UILabel!
    @IBOutlet var writingLabel: UILabel!

    var schoolData: School?

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
    }

    @objc func handleSwipeGesture() {
        dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        schoolLabel.text = schoolData!.schoolName
        readingLabel.text = "Critcal Reading Avg Score: \(schoolData!.satCriticalReadingAvgScore)"
        mathLabel.text = "Math Avg Score: \(schoolData!.satMathAvgScore)"
        writingLabel.text = "Writing Avg Score: \(schoolData!.satWritingAvgScore)"
    }
}
