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
    @IBOutlet var textView: UITextView!
    @IBOutlet weak var swipeDownArrowImageView: UIImageView!
    
    var schoolData: School?

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
        viewLayout()
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

        // -----------------------------------------------
        // Description:
        let descString = """
        The most recent school level results for New York City on the SAT.\nResults are available at the school level for the graduating seniors of 2012.\nRecords contain 2012 College-bound seniors mean SAT scores taken during SY 2012.
        """
    
        msg = NSAttributedString.palatinoWithSizeAndColor(inputString: descString, size: 18.0, color: .gray)
        textView.attributedText = msg
    }

    func viewLayout() {
        view.backgroundColor = UIColor.skyBlue
        textView.anchor(top: nil,
                        bottom: view.safeAreaLayoutGuide.bottomAnchor,
                        left: view.safeAreaLayoutGuide.leftAnchor,
                        right: view.safeAreaLayoutGuide.rightAnchor,
                        centerYAnchor: nil,
                        centerXAnchor: nil,
                        paddingTop: 0,
                        paddingLeft: 0,
                        paddingBottom: -10,
                        paddingRight: 0, width: 0, height: 200)
    }
}

