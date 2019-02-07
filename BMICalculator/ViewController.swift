//
//  ViewController.swift
//  BMICalculator
//
//  Created by GDROM on 24/1/2562 BE.
//  Copyright © 2562 GDROM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bmiScore: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    enum BMICategory: String {
        case obese
        case overweight
        case healthy
        case underweight
    }
    
    let lookupTable: [Double, String] = [
        [27.5, BMICategory.obese],
        [23.0, BMICategory.overweight],
        [18.5, BMICategory.healthy],
    ]
    
    func determineCategory(_ bmi: Double) -> String {
        for row in lookupTable {
            if bmi > row[0] {
                return row[1].rawValue
            }
        }
        return BMICategory.underweight.rawValue
    }
    
    @IBAction func handleCalculate(_ sender: UIButton) {
        
        let height = Double(heightTextField.text!)! / 100
        let weight = Double(weightTextField!.text!)
        let bmi = weight! / (height * height)
        bmiScore.text = String(format: "%.2f", bmi)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    


}

