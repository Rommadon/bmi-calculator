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
    @IBOutlet weak var bmiTypeLabel: UILabel!
    @IBOutlet weak var bmiImageView: UIImageView!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    enum BMICategory: String {
        case obese
        case overweight
        case healthy
        case underweight
    }
    
    let lookupTable = [
        [27.5, BMICategory.obese],
        [23.0, BMICategory.overweight],
        [18.5, BMICategory.healthy] ,
    ]
    
    let imageLookupTable = [
        BMICategory.obese: "Obese.jpg",
        BMICategory.overweight: "Overweight.jpg",
        BMICategory.healthy: "healthy.jpg",
        BMICategory.underweight: "underweight.jpg",
    ]
    
    func determineCategory(_ bmi: Double) -> BMICategory {
        for row in lookupTable {
            let min = row[0] as! Double
            if bmi > min {
                return (row[1] as! BMICategory)
            }
        }
        return BMICategory.underweight
    }
    
    @IBAction func handleCalculate(_ sender: UIButton) {
        
        let height = Double(heightTextField.text!)! / 100
        let weight = Double(weightTextField!.text!)
        let bmi = weight! / (height * height)
        bmiScore.text = String(format: "%.2f", bmi)
        let bmiCat = determineCategory(bmi)
        bmiImageView.image = UIImage(named: imageLookupTable[bmiCat]!)
        bmiTypeLabel.text = bmiCat.rawValue.capitalized
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiTypeLabel.text = determineCategory(0).rawValue.capitalized
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    


}

