func getMilk(numContainers:Int) {
	print("buy \(numContainers)")
	print("pay $\(numContainers * 2)")
}

func getMilkWithChange(numContainers:Int, moneyProvided:Int) -> Int {
	let cost = numContainers * 2
	print("buy \(numContainers)")
	print("pay $\(cost)")
	
	return moneyProvided - cost
}

//getMilk(numContainers: 7)

let change = getMilkWithChange(numContainers: 19, moneyProvided: 100)
print("change: $\(change)")
