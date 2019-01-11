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
    
    func getWeather() {
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q=Kiev&APPID=60cf95f166563b524e17c7573b54d7e3"
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            let result = try? JSONSerialization.jsonObject(with: data) as? [String : AnyObject]
            result?.do {
                let main = $0["main"] as? [String : Double]
                main.do {
                    let a = Float($0["temp"]! - 273.15)
                    print(a)
                }
            }
        }.resume()

//        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else { return }
//            let decoder = JSONDecoder()
//            let d = String.init(bytes: data!, encoding: .utf8)
            
//            let res = data.flatMap {
//                try? decoder.decode(Weathers.self, from: $0)
//            }
            
//            print(res)
//            let result = data.flatMap { try? decoder.decode([Weathers].self, from: $0) }
//            self.weathers = res ?? nil
      
//        task.resume()
//        print(self.weathers)
    }
}
