//
//  ViewController.swift
//  Dicee
//
//  Created by Steve Zimmers on 2018-02-22.
//  Copyright © 2018 Steve Zimmers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	/*
    var randomDiceIndex1:Int = 0
    var randomDiceIndex2:Int = 0
*/
    
    let diceImageNames = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
	
	func rollDice() {
		// yields 0-5
		let roll1 = Int(arc4random_uniform(6))
		let roll2 = Int(arc4random_uniform(6))

		diceImageView1.image = UIImage(named: diceImageNames[roll1])
		diceImageView2.image = UIImage(named: diceImageNames[roll2])
	}

    override func viewDidLoad() {
		super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		self.becomeFirstResponder()
		
		rollDice()
    }

	// We are willing to become first responder to get shake motion
	override var canBecomeFirstResponder: Bool {
		get {
			return true
		}
	}

	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		if motion == .motionShake {
			rollDice()
		}
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func rollButtonPressed(_ sender: UIButton) {
		rollDice()
    }
}

