import UIKit

func fibonacci(count: Int) {
	var prev:Double = 0
	var next:Double = 1
	var result:Double = 0

	print(Int(prev))

	for _ in 1..<count {
		result = prev + next
		prev = next
		next = result
		print(Int(result))
	}
}

fibonacci(count: 22)
