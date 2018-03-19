//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    //let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    let APP_ID = "6a78596d062df78380eff5944c4e5567"
    

    //TODO: Declare instance variables here
	let locationManager = CLLocationManager()
	let weatherDataModel = WeatherDataModel()
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO:Set up the location manager here.
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
		locationManager.requestWhenInUseAuthorization()
		
		locationManager.startUpdatingLocation()
    }

    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    

	func getWeatherData(url: String, parameters: [String:String]) {

		Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
			if response.result.isSuccess {
				let weatherData:JSON = JSON(response.result.value!)
				self.updateWeatherData(data: weatherData)
			}
			else {
				print("error: \(String(describing: response.result.error))")
				self.cityLabel.text = "Could not fetch weather"
			}
			
			/*
			print("Request: \(String(describing: response.request))")   // original url request
			print("Response: \(String(describing: response.response))") // http url response
			print("Result: \(response.result)")                         // response serialization result
			
			if let json = response.result.value {
				print("JSON: \(json)") // serialized json response
			}
			
			if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
				print("Data: \(utf8Text)") // original server data as UTF8 string
			}
*/
		}
	}

    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
	
	func updateWeatherData(data:JSON) {
		if let temperature = data["main"]["temp"].double {
			weatherDataModel.temperature = Int(temperature - 273.15)
			//self.temperatureLabel.text = temperature
		}
		else {
			print("nope")
		}
	}

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let location = locations[locations.count - 1]
		
		if location.horizontalAccuracy > 0 {
			locationManager.stopUpdatingLocation()
			
			let lat = String(location.coordinate.latitude)
			let lng = String(location.coordinate.longitude)

			let params:[String:String] = ["appid" : APP_ID, "lat" : lat, "lon" : lng]
			
			getWeatherData(url: WEATHER_URL, parameters: params)
		}
	}
    
    //Write the didFailWithError method here:
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error)
		cityLabel.text = "Location Unavailable"
	}

    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


