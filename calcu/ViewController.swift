//
//  ViewController.swift
//  calcu
//
//  Created by Steven Walentino on 3/5/17.
//  Copyright © 2017 Steven Walentino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var tipSelect: UISegmentedControl!
    @IBOutlet weak var tot: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "defaultTip")
        tipSelect.selectedSegmentIndex = defaultTip
    }
    
    @IBAction func tap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onChange(_ sender: AnyObject) {
        let tipChoices = [0.15, 0.18, 0.2]
        let billVal = Double(bill.text!) ?? 0
        
        let taxVal = billVal * 0.1
        let tipVal = (billVal+taxVal) * tipChoices[tipSelect.selectedSegmentIndex]
        let totVal = billVal + taxVal + tipVal
        
        tax.text = String.init(format: "$%.2f", taxVal)
        tip.text = String.init(format: "$%.2f", tipVal)
        tot.text = String.init(format: "$%.2f", totVal)
    }
    
}

