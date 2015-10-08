//
//  ViewController.swift
//  8bit-calc
//
//  Created by Jake Krajewski on 10/7/15.
//  Copyright © 2015 Jake Krajewski. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // ENUMS
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    // PROPERTIES
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    
    // OUTLETS
    @IBOutlet weak var outputLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    // know which button was pressed
    @IBAction func numberPressed(btn: UIButton!) {
        playSound()
        
        if runningNumber.characters.count < 10 {
            runningNumber += "\(btn.tag)"
            outputLbl.text = runningNumber
        }
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onMinusPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(op: Operation){
        playSound()
        
        if currentOperation != Operation.Empty {
            // Run some math
        } else {
            // This is the first time the operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound(){
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
}

