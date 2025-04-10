//
//  JsonDownloader.swift
//  WeatherApp
//
//  Created by Mehmet Seyhan on 17.11.2024.
//

import Foundation

class JsonDownloader {
   
    //API  - metin
    let ApiKEY = "&appid=8f84d51bcab1852dcade6d30d1e57566"
    let BasePath = "https://api.openweathermap.org/data/2.5/weather?q="
    var apiURlString =  ""
    // metin url mi?
    
    init() {
        apiURlString = BasePath + "London" + ApiKEY
    }
    
    func sehirAdiAta(sehirAdi: String) {
        apiURlString = BasePath + sehirAdi + ApiKEY
    }

    
    func havaVerisiniAl(completionHandlder: @escaping (HavaModel?) -> Void) {
        print("apiURlString \(apiURlString)")
        let url = URL(string: apiURlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                let havaVerisi = try? JSONDecoder().decode(HavaModel.self, from: data)
                completionHandlder(havaVerisi)
            }
            
        }
        
        task.resume()
        
        
    }
    
}
