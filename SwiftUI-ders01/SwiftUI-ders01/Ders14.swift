//
//  Ders14.swift
//  SwiftUI-ders01
//
//  Created by Mehmet Seyhan on 8.03.2025.
//

import SwiftUI
import Alamofire
import UIKit

struct UIKitSlider: UIViewRepresentable {
    @Binding var value: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = value
        
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: UIKitSlider
        
        init(_ parent: UIKitSlider) {
            self.parent = parent
        }
        
        @objc func valueChanged(_ sender: UISlider){
            parent.value = sender.value
        }
    }
    
    
}

struct Ders14: View {    
    @StateObject var viewModel = KullanicilarViewModel()
    @State var sliderDeger: Float = 50.0
    
    var body: some View {
        VStack{
            Text(viewModel.veriler)
                .padding()
            
            Button("Verileri al"){
                
                viewModel.kullanicilariAl()
            }
            
            UIKitSlider(value: $sliderDeger)
                .frame(width: 300)
            
            UlkeViewControllerWrapper()
                .frame(height: 400)
            
            Spacer()
          
        }
    }

}

#Preview {
    Ders14()
}
