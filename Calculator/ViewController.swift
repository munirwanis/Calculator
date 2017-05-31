//
//  ViewController.swift
//  Calculator
//
//  Created by Munir Wanis on 30/05/17.
//  Copyright © 2017 Munir Wanis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    @IBAction func numberWasPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if userIsTyping {
            if display.text!.characters.count < 7 {
                display.text = display.text! + number
            }
        } else {
            userIsTyping = true
            display.text = number
        }
    }
    
    var displayNumber: Double {
        get {
            return Double(display.text!)!
        } set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func operationWasPressed(_ sender: UIButton) {
        userIsTyping = false
        let operation = sender.currentTitle!
        switch operation {
        case "π":
            displayNumber = Double.pi
        case "√":
            displayNumber = sqrt(displayNumber)
        default:
            break
        }
    }
    
}

