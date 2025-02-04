import UIKit

var greeting = "Hello, playground"

/*
 []  -> dizi
 {} -> obje
  anahtad: deger
 
 JSON objesi
 
 {
    "ad": "mehmet can",
    "soyad": "seyhan",
    "yas" : 30,
    "bildigi_diller": ["turkce","kurtce","isvecce","ingilizce"],
    "yasadigi_ulke": {
        "ad": "isvec",
        "para_birimi": "kron",
        "konum": "kuzey avrupa"
    }
 }
 
 */

struct Kisi {
    var ad: String?
    var soyad: String?
    var yas: Int?
    var bildigi_diller: [String]? //enumla camelcase yapmam lazim
    var yasadigi_ulke: YasadigiUlke?
}


struct YasadigiUlke {
    var ad: String?
    var para_birimi: String?
    var konum: String?
}


/*
 Elinizde bir adet okul json objesi bulunsun icinde okul_adi, okul_yapim_tarihi, okul_renkleri ile birlikte ayni zamanda sinif adinda bir bojesi de olsun. sinif_sandelye_sayisi ve sinif_renk i icinde barindirsin bu sinif objesi.
    Buna uygun bir json olusturunuz ve bunu swift dilindeki bir objeye ceviriniz
 
 */


//API  - metin
let apiURlString = "https://api.openweathermap.org/data/2.5/weather?q=London&appid=8f84d51bcab1852dcade6d30d1e57566"


// metin url mi?  https://api.coindesk.com/v1/bpi/currentprice.json
if let apiURL = URL(string: apiURlString) {
    //oturum ornegi
    let session = URLSession.shared
    //bir gorev
    let dataTask = session.dataTask(with: apiURL) {(data, response, error) in
        //hata kontrolu
        if let error = error {
            print(error)
            return
        }
        //veri var mi?
        guard let responseData = data else {
            print("veri alinmadi")
            return
        }
        do {//veri paketini json olarak al
            if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String : Any]{
                print(json)
            }
        }catch{
            print(error)
        }
    }
    //islemi baslat
    dataTask.resume()
}

/*
 bir apiye istek atarak verileri konsolda yazdiriniz
 
 */
