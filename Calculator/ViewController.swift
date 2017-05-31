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
    
    private var brain = CalculatorBrain()
    
    @IBAction func operationWasPressed(_ sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayNumber)
        }
        userIsTyping = false
        if let operation = sender.currentTitle {
            brain.performOperation(operation)
        }
        if let result = brain.result {
            displayNumber = result
        }
    }
    
}

