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
	//var colour = "Black"
	var colour
	var numSeats = 5
	var bodyType:CarType = .Coupe
	
	init(customerChosenColour:String = "Black") {
		colour = customerChosenColour
	}
}
