//
//  CountriesView.swift
//  WeatherAPI
//
//  Created by Student on 10.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CountriesView: UIView {
    
    struct Countries: Codable {
        var name: String
        var capital: String
    }
    
    struct Weathers: Codable {
        var name: String
        var id: Int?
        let main: [String : Double]?
    }
    
    var countries: [Countries]? {
        didSet {
            DispatchQueue.main.async {
                self.table?.reloadData()
            }
        }
    }
    
    var weathers: Weathers? {
        didSet {
            DispatchQueue.main.async {
                self.table?.reloadData()
            }
        }
    }

    @IBOutlet var table: UITableView?
    
    func getCountries() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, respose, error) in
                let countries = data.flatMap { try? JSONDecoder().decode([Countries].self, from: $0) }
                countries.do { self.countries = $0 }
            }.resume()
        }
    }
    
    func getWeather(city: String) {
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
        let apiKey = "&APPID=60cf95f166563b524e17c7573b54d7e3"
        guard let url = URL(string: baseUrl + city + apiKey) else { return }
        URLSession.shared.dataTask(with: url) { (data, respose, error) in
            let weather = data.flatMap { try? JSONDecoder().decode(Weathers.self, from: $0) }
            guard let tempKelvin = weather?.main?["temp"] else { return }
            let tempCelciy = Int(tempKelvin - 273.15)
            print(tempCelciy)
        }.resume()
    
    }
}
