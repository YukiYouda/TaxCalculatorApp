//
//  TotalViewController.swift
//  TaxCalculatorApp
//
//  Created by YUKI YOUDA on 2021/11/10.
//

import UIKit

class TotalViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var resultArray: [Double] = []
    var sum: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "add") != nil {
            resultArray = UserDefaults.standard.object(forKey: "add") as! [Double]
            sum = resultArray.reduce(0) { (num1:Double, num2:Double) -> Double in
                return num1 + num2
            }
            totalLabel.text = String(format: "%.0f", sum)
        } else {
            totalLabel.text = "エラー"
        }
    }
}
