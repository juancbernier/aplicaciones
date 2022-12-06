//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip : Double = 0.1
    var cantidad :Int = 0
    var billTotal = 0.0
    var result: Double = 0
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if zeroPctButton.isTouchInside {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }else if tenPctButton.isTouchInside {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        }else if twentyPctButton.isTouchInside {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value)
        cantidad = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPctButton.isSelected {
            tip = 0
            print("\(tip)%")
        }else if tenPctButton.isSelected {
            tip = 0.1
            print("\(tip)%")
        }else if twentyPctButton.isSelected {
            tip = 0.2
            print("\(tip)%")
        }
        
        let bill  = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
        }
        
        result = (billTotal * (tip + 1)) / Double(cantidad)
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let r = segue.destination as! ResultsViewController
            r.resultado = result
            let c = segue.destination as! ResultsViewController
            c.cantidades = cantidad
            let t = segue.destination as! ResultsViewController
            t.tips = tip
        }
    }
    
    
    
}

