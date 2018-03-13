//
//  main.swift
//  Classes and Objects
//
//  Created by Steve Zimmers on 2018-03-12.
//  Copyright © 2018 Steve Zimmers. All rights reserved.
//

import Foundation

let car1 = Car()
let car2 = Car(customerChosenColour: "Green")
let car3 = SelfDrivingCar()

car3.numSeats = 2
car3.drive()
