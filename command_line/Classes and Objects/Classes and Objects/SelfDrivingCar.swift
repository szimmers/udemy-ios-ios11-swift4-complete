//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Steve Zimmers on 2018-03-13.
//  Copyright © 2018 Steve Zimmers. All rights reserved.
//

import Foundation

class SelfDrivingCar:Car {
	// value might be nil
	var destination:String?
	
	override func drive() {
		super.drive()
		
		// optional binding. no need to unwrap with !
		if let userSetDestination = destination {
			print("heading to \(userSetDestination)")
		}
		else {
			print("wandering aimlessly")
		}
	}
}
