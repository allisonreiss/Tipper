//
//  ViewController.swift
//  Tipper
//
//  Created by Allison Reiss on 11/6/17.
//  Copyright © 2017 Allison Reiss. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    //@IBOutlet var mainView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoSplitLabel: UILabel!
    @IBOutlet weak var threeSplitLabel: UILabel!
    @IBOutlet weak var fourSplitLabel: UILabel!
    @IBOutlet weak var fiveSplitLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
       billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        if let intValue = defaults.value(forKey:"defaultTip") as? Int
        {
            tipControl.selectedSegmentIndex = intValue
        }
        
        calculateTip(self)
        
        billField.becomeFirstResponder()

        if let colorIdx = defaults.value(forKey:"backColorIdx") as? Int
        {
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

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.10, 0.15, 0.20]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let twoSplit = total/2
        let threeSplit = total/3
        let fourSplit = total/4
        let fiveSplit = total/5
       
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoSplitLabel.text = String(format: "$%.2f", twoSplit)
        threeSplitLabel.text = String(format: "$%.2f", threeSplit)
        fourSplitLabel.text = String(format: "$%.2f", fourSplit)
        fiveSplitLabel.text = String(format: "$%.2f", fiveSplit)
    }
    
    
}

