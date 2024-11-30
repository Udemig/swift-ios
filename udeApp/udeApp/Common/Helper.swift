//
//  Helper.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 24.11.2024.
//

import Foundation
import UIKit

class Helper {
    static func dialogMessage(message: String, vc: UIViewController){
        let alert = UIAlertController(title: "Uyari", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        vc.present(alert, animated: true)
    }
    
    static func imageLoad(imageView: UIImageView, url: String){
        let downloadTask = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
           if error == nil && data != nil {
               let image = UIImage(data: data!)
               DispatchQueue.main.async {
                   imageView.image = image
               }
            }
          
        }
        downloadTask.resume()
    }
}
