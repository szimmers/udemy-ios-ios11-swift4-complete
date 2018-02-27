import UIKit

func calculateLove(name1:String, name2:String) -> String {
	let loveScore = arc4random_uniform(101)
	
	if loveScore > 80 {
		return "good"
	}
	else if loveScore > 40 {
		return "meh"
	}
	else {
		return "bad"
	}
}

let score = calculateLove(name1: "larry", name2: "bob")
print(score)
