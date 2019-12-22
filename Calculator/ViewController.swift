//
//  ViewController.swift
//  Calculator
//
//  Created by user920617 on 12/22/19.
//  Copyright © 2019 user920617. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberFromScreen:Double = 0;
    var firstNumber:Double = 0;
    var operation:Int = 0;
    var mathSign:Bool = false;
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            if sender.tag == 16 {
                result.text = String(-Double(result.text!)!)
            } else if sender.tag == 17 {
                result.text = String(Double(result.text!)! / 100)
            } else if sender.tag == 18 {
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 10
                formatter.numberStyle = .decimal
                result.text = formatter.string(for: Double(result.text!) ?? "n/a")
                if let i = String(result.text!).firstIndex(of: ".") {
                    
                }
                else {
                    result.text = result.text! + "."
                }
            } else {
                result.text = result.text! + String(sender.tag)
                
            }
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15{
            firstNumber = Double(result.text!)!
            if sender.tag == 11 {
                result.text = "/"
            }
            else if sender.tag == 12 {
                result.text = "x"
            }
            else if sender.tag == 13 {
                result.text = "-"
            }
            else if sender.tag == 14 {
                result.text = "+"
            }
            operation = sender.tag
            mathSign = true
        } else if sender.tag == 15 {
            if operation == 11 {
                result.text = String(firstNumber / numberFromScreen)
            }
            if operation == 12 {
                result.text = String(firstNumber * numberFromScreen)
            }
            if operation == 13 {
                result.text = String(firstNumber - numberFromScreen)
            }
            if operation == 14 {
                result.text = String(firstNumber + numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNumber = 0
            numberFromScreen = 0
            operation = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

