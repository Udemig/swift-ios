//
//  CodableBundleExtension.swift
//  Udemig-E-commerce-SwiftUI
//
//  Created by Mehmet Seyhan on 15.03.2025.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: "") else {
            fatalError("yol bulunamadi")
            
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("yuklemede hata oldu")
            
        }
        
        let decoder = JSONDecoder()
        
        guard let decodeData = try? decoder.decode(T.self, from: data) else {
            fatalError("decode edilemedi")
            
        }
        
        return decodeData
        
    }
}
