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

        // Reading:
        var msg = NSAttributedString.palatino(inputString: "Critical Reading Avg Score: ")
        var value = NSAttributedString.palatinoWithSizeAndColor(inputString: schoolData!.satCriticalReadingAvgScore, size: 18, color: .red)
        var attributedString: NSMutableAttributedString = NSMutableAttributedString(attributedString: msg)
        attributedString.append(value)
        readingLabel.attributedText = attributedString

        // -----------------------------------------------
        // Math Score:
        msg = NSAttributedString.palatino(inputString: "Math Avg Score: ")
        value = NSAttributedString.palatinoWithSizeAndColor(inputString: schoolData!.satMathAvgScore, size: 18, color: .red)
        attributedString = NSMutableAttributedString(attributedString: msg)
        attributedString.append(value)
        mathLabel.attributedText = attributedString

        // -----------------------------------------------
        // Writing:
        msg = NSAttributedString.palatino(inputString: "Writing Avg Score: ")
        value = NSAttributedString.palatinoWithSizeAndColor(inputString: schoolData!.satWritingAvgScore, size: 18, color: .red)
        attributedString = NSMutableAttributedString(attributedString: msg)
        attributedString.append(value)
        writingLabel.attributedText = attributedString
    }
}

