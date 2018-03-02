//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

// less included the delegate, but it works w/o
class ViewController: UIViewController, AVAudioPlayerDelegate {
	
	var player:AVAudioPlayer?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	func playSound(_ noteNum:Int) {
		let noteName:String = "note\(noteNum)"
		let url = Bundle.main.url(forResource: noteName, withExtension: "wav")!
		
		do {
			player = try AVAudioPlayer(contentsOf: url)
			guard let player = player else { return }
			
			player.prepareToPlay()
			player.play()
		}
		catch let error as NSError {
			print(error.description)
		}
	}
	
    @IBAction func notePressed(_ sender: UIButton) {
		playSound(sender.tag)
    }

}

