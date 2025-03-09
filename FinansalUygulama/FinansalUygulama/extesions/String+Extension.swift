//
//  String+Extension.swift
//  FinansalUygulama
//
//  Created by Mehmet Seyhan on 9.03.2025.
//

import Foundation

extension String {
    func addBrackets() -> String {
        return "(\(self))"
    }
    
    func prefix(withText text: String) -> String {
        return text + self
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
}
