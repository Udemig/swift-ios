//
//  Date+Extesions.swift
//  FinansalUygulama
//
//  Created by Mehmet Seyhan on 9.03.2025.
//

import Foundation

extension Date {
    
    var MMYYFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
