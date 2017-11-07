//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Allison Reiss on 11/6/17.
//  Copyright © 2017 Allison Reiss. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        if let intValue = defaults.value(forKey:"defaultTip") as? Int
        {
            defaultTipControl.selectedSegmentIndex = intValue
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        
        //Force UserDefaults to save
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
