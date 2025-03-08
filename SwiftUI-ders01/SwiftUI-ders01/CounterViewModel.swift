//
//  CounterViewModel.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import Foundation
import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    
    @Published var sayac = 0
    var cancellable: AnyCancellable?
    
    init() {
       /* cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.sayac += 1
            }
        */
    }
    
    func sayacDurdur() {
        cancellable = nil
    }
}
