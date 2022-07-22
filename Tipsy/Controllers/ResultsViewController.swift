//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jakob Skov Søndergård on 18/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var totalPrPersonValue:String?
    var splitNumber:String?
    var tipPercent:String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalPrPersonValue ?? "could not be calculated"
        settingsLabel.text = "Split between \(splitNumber ?? "unknown amount of") people, with \(tipPercent ?? "unknown")% tip."

    }


    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
