//
//  SoruHavuzu.swift
//  kimMilyonerOlmakIster
//
//  Created by Mehmet Seyhan on 16.11.2024.
//

import Foundation
struct SoruHavuzu {
    
    var soruNumarasi = 0
    var sonuc = 0
    
    let sinav = [
        Soru(yazi: "Istanbulun fethi 1980 de dir", cevap: "Yanlis"),
        Soru(yazi: "Isvec Avrupadadir", cevap: "Yanlis"),
        Soru(yazi: "Ankara Turkiyenin Baskentidir", cevap: "Dogru"),
        Soru(yazi: "Yunan TR ye komsudur", cevap: "Dogru"),
        Soru(yazi: "Kibris 2 parcadir", cevap: "Dogru"),
        Soru(yazi: "Araplar siyahidir", cevap: "Yanlis"),
        Soru(yazi: "Swift xcode ile yazilir", cevap: "Dogru"),
        Soru(yazi: "Swift 2014 yilinda cikmistir", cevap: "Dogru"),
        Soru(yazi: "Turkce German dil gurubundadir", cevap: "Yanlis"),
        Soru(yazi: "Iran Avrupadadir", cevap: "Yanlis")
    ]
    
    func soruyuAl() -> String {
        return sinav[soruNumarasi].yazi
    }
    
    func ilerlemeCubuguAl() -> Float {
        return Float(soruNumarasi) / Float(sinav.count)
    }
    
     func sonucuAl() -> Int {
        return sonuc
    }
    
    mutating func siradakiSoru(){
        if soruNumarasi + 1 < sinav.count {
            soruNumarasi = soruNumarasi + 1
        } else {
            soruNumarasi = 0
        }
    }
    
    mutating func cevabiKontrolEt(kullaniciCevabi: String) -> Bool{
        if kullaniciCevabi == sinav[soruNumarasi].cevap{
            sonuc = sonuc + 1
            return true
        }else {
            return false
        }
    }
}
