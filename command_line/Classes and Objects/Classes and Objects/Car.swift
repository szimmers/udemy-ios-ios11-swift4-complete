//
//  Car.swift
//  Classes and Objects
//
//  Created by Steve Zimmers on 2018-03-12.
//  Copyright © 2018 Steve Zimmers. All rights reserved.
//

import Foundation

enum CarType {
	case Sedan
	case Coupe
	case Hatchback
}

class Car {
	var colour = "Black"
	var numSeats = 5
	var bodyType:CarType = .Coupe
	
	init() {
		
	}
	
	convenience init(customerChosenColour:String) {
		self.init()
		colour = customerChosenColour
	}
}
