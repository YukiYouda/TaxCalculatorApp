//
//  ViewController.swift
//  TaxCalculatorApp
//
//  Created by YUKI YOUDA on 2021/11/09.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var taxSelect: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var cost: Double = 0
    var addTaxCost:Double = 0
    var results: [Double] = []
    var addTaxCostString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        results.removeAll()
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        
        if textField.text != "" &&  Int(textField.text!) != nil {
            if taxSelect.selectedSegmentIndex == 0 {
                calc(tax:1.1)
            } else {
                calc(tax: 1.08)
            }
        } else {
            textField.text = ""
            textLabel.text = ""
        }
    }
    
    @IBAction func taxChange(_ sender: Any) {
       
        if textField.text != "" &&  Int(textField.text!) != nil {
            if taxSelect.selectedSegmentIndex == 0 {
                calc(tax:1.1)
            } else {
                calc(tax: 1.08)
            }
        } else {
            textField.text = ""
            textLabel.text = ""
        }
    }
        
    
    @IBAction func addButton(_ sender: Any) {
        if addTaxCost != 0 {
            results.append(contentsOf: [addTaxCost])
            UserDefaults.standard.set(results, forKey: "add")
            
            addTaxCost = 0
            textField.text = ""
            textLabel.text = ""
            
            self.tableView.reloadData()
        }
    }
    
    func calc(tax:Double) {
        cost = Double(textField.text!)!
        addTaxCost = cost * Double(tax)
        
        addTaxCostString = String(format: "%.0f", addTaxCost)
        textLabel.text = addTaxCostString
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        cell.textLabel?.text = "\(results[indexPath.row])"
        return cell
    }
}

