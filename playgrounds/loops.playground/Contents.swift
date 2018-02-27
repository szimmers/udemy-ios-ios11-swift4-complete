import UIKit

func printForMe(thisNumber theGivenNumber:Int) {
	print(theGivenNumber)
}

printForMe(thisNumber: 5)

func printItForMe(_ theGivenItem:String) {
	print(theGivenItem)
}

printItForMe("boop")

let nums = [1, 3, 4, 7, 9, 10, -2, 77]

print("-----------------")
var sum = 0
for num in nums {
	sum += num
}

print(sum)


print("-----------------")
for num in 1...5 {
	print(num)
}

print("-----------------")
for num in 1..<5 {
	print(num)
}

print("-----------------")
for num in 1..<10 where num % 2 == 0 {
	print(num)
}

print("-----------------")
let n = 3
for num in 1...n {
	print(num)
}

print("-----------------")
for num in (1...n).reversed() {
	print(num)
}
