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
    // PROPERTIES
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var operation = ""
    
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
        
        btnSound.play()
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
    }
    
    @IBAction func onMinusPressed(sender: AnyObject) {
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
    }
    
    
    @IBAction func onEqualPressed(sender: AnyObject) {
    }
    
}

