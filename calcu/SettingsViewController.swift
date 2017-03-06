//
//  SettingsViewController.swift
//  calcu
//
//  Created by Steven Walentino on 3/5/17.
//  Copyright © 2017 Steven Walentino. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var select: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func selectDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(select.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "defaultTip") 
        select.selectedSegmentIndex = defaultTip
    }
    
}
