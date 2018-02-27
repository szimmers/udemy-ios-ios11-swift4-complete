import UIKit

func calcBMI(height:Double, weight:Double) -> Double {
	let bmi:Double = weight / pow(height, 2)
	print(String(format: "%.2f", bmi))
	return bmi
}

func interpretBMI(bmi:Double) -> String {
	if bmi > 25 {
		return "overweight"
	}
	else if bmi < 18.5 {
		return "underweight"
	}
	else {
		return "normal"
	}
}

let assessment = interpretBMI(bmi: calcBMI(height: 1.8, weight: 90))
print(assessment)
