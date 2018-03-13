//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Steve Zimmers on 2018-03-13.
//  Copyright © 2018 Steve Zimmers. All rights reserved.
//

import Foundation

class SelfDrivingCar:Car {
	var destination:String = "Timville"

	override func drive() {
		super.drive()

		print("heading to \(destination)")
	}
}
