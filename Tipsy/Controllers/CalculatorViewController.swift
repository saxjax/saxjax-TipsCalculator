//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Jakob Skov Søndergård on 18/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: Any) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        let activeButton = sender as! UIButton

        activeButton.isSelected = true

        let value = activeButton.titleLabel?.text

        calculatorBrain.setSelectedTipPct(pctString: value! )

    }

    @IBAction func stapperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        calculatorBrain.splitNumber = Int(sender.value)
        splitNumberLabel.text = calculatorBrain.getSplitNumberText()
    }


    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        calculatorBrain.billTotal = Float(billTextField.text ?? "0.0")

        print(calculatorBrain.splitTheBill())
    }



    override func viewDidLoad() {
        calculatorBrain.splitNumber = 2
        calculatorBrain.billTotal = 100

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
