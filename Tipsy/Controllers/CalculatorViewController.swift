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
    @IBOutlet weak var splitNumberStepper: UIStepper!

    @IBAction func billTotalTextFieldChanged(_ sender: UITextField) {
        calculatorBrain.billTotal = Float(billTextField.text ?? "0.0")

    }

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
        performSegue(withIdentifier: "showResult", sender: self)

    }



    override func viewDidLoad() {
        calculatorBrain.billTotal = 0
        calculatorBrain.setSelectedTipPct(pctString: tenPctButton.titleLabel?.text ?? "0")
        calculatorBrain.splitNumber = Int(splitNumberStepper.value)

        billTextField.text = "\(calculatorBrain.billTotal ?? 0.0)"
        splitNumberLabel.text = (calculatorBrain.getSplitNumberText())
        

    }


    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "showResult" {
     let  destinationVC = segue.destination as! ResultsViewController
         destinationVC.splitNumber = calculatorBrain.getSplitNumberText()
         destinationVC.tipPercent = calculatorBrain.getSelectedTipPct()
         destinationVC.totalPrPersonValue = calculatorBrain.splitTheBill()

     }
     }

}
