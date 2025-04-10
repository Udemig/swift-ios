//
//  KullanicilarViewModel.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import Foundation
import SwiftUI
import Alamofire

class KullanicilarViewModel: ObservableObject {
    
    @Published var veriler: String = ""
    
    init() {
        
    }
    
    func kullanicilariAl(){
        AF.request("https://api.nationalize.io/?name=nathanie")
            .responseString { response in
                switch response.result {
                case .success(let value):
                    self.veriler = value
                case .failure(let error):
                    self.veriler = error.localizedDescription
                }
            }
    }
}
