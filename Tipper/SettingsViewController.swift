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
    @IBOutlet weak var backgroundColorControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        if let intValue = defaults.value(forKey:"defaultTip") as? Int
        {
            defaultTipControl.selectedSegmentIndex = intValue
        }
        
        if let colorIdx = defaults.value(forKey:"backColorIdx") as? Int
        {
            backgroundColorControl.selectedSegmentIndex = colorIdx
            
            //Set color
            switch colorIdx {
            case 1:
                self.view.backgroundColor = UIColor.purple
            case 2:
                self.view.backgroundColor = UIColor.green
            case 3:
                self.view.backgroundColor = UIColor.red
            default:
                self.view.backgroundColor = UIColor.cyan
            }
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
    
    
    @IBAction func setBackgroundColor(_ sender: Any) {
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        defaults.set(backgroundColorControl.selectedSegmentIndex, forKey: "backColorIdx")
        
        //Force UserDefaults to save
        defaults.synchronize()
        
        //Set color
        switch backgroundColorControl.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.purple
        case 2:
            self.view.backgroundColor = UIColor.green
        case 3:
            self.view.backgroundColor = UIColor.red
        default:
            self.view.backgroundColor = UIColor.cyan
        }

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
