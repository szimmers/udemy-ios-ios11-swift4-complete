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
				self.showError(errorText: "Could not fetch weather")
			}
		}
	}

    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
	
	func updateWeatherData(data:JSON) {
		if let temperature = data["main"]["temp"].double {
			weatherDataModel.temperature = Int(temperature - 273.15)
			weatherDataModel.city = data["city"].stringValue
			weatherDataModel.condition = data["weather"][0]["id"].intValue
			weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)

			updateUIWithWeatherData()
		}
		else {
			showError(errorText: "Weather Unavailable")
		}
	}

    //MARK: - UI Updates
    /***************************************************************/
	
	func showError(errorText:String) {
		cityLabel.text = errorText
	}
    
    //Write the updateUIWithWeatherData method here:
	func updateUIWithWeatherData() {
		cityLabel.text = weatherDataModel.city
		temperatureLabel.text = String(weatherDataModel.temperature)
		weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
	}

    
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
		showError(errorText: "Location Unavailable")
	}

    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


