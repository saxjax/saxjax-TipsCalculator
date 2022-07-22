//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Jakob Skov Søndergård on 18/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var billTotal:Float?
    var selectedTipPct:Float?
    var splitNumber:Int?
//    var splitupAmount:Float?
    var currency:String?



    private func _splitTheBill(amount:Float, selectedTipPct:Float, splitNumber:Int) -> String{
        let splitAmount:Float = (amount + amount*selectedTipPct/100 )/Float(splitNumber)

        return _returnCurrency(value: splitAmount, postFix: currency ?? "")
    }

    private func _returnCurrency(value:Float,postFix:String)->String{
        return String(format: "%.2f", value) + postFix
    }



    func getSplitNumberText()-> String{
        if let evalSplitNumber = splitNumber {
            return "\(evalSplitNumber)"
        }
        else {
            return "not set"
        }


    }
    func getBillTotal(value:Float)->String{
        let evalValue = billTotal ?? 0.0
        return String(format: "%.2f", evalValue)
    }

    func getSelectedTipPct()->String{
        let evalValue = selectedTipPct ?? 0.0
        return String(format: "%.2f", evalValue)
    }

    mutating func setSelectedTipPct(pctString:String){
        let cleanedResultString = pctString.replacingOccurrences(of: "%", with: "")
        let result = Float(cleanedResultString)

        selectedTipPct = result

    }

    func splitTheBill()-> String{
        if ((billTotal != nil) && (selectedTipPct != nil) && (splitNumber != nil)){
        return _splitTheBill(amount: billTotal!, selectedTipPct: selectedTipPct!, splitNumber: splitNumber!)
        }
        else {
            return "You need to fill in bill amount, tip percentage, and number of persons that split the bill"
        }
    }


}
