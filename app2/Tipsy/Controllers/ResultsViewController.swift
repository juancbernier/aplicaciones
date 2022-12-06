//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultado: Double?
    var cantidades: Int?
    var tips: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let texto = String("es el valor a pagar entre \(cantidades!) y \(tips!*100)% de propina")
        totalLabel.text = String(format: "%.1f",resultado ?? 0.0)
        settingsLabel.text = texto
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
    
}
