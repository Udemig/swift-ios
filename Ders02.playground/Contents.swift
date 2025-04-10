
import UIKit

var greeting = "Hello, playground"
//Nested functions
func selamla() {
    ictenSelamla()
    
    print("merhabalar")
    
    func ictenSelamla(){
        print("icimden selamladim")
    }
    
}

selamla()
//Overloading

func topla1(a: Int, b:Int) {
    let toplam = a+b
    print("toplam: \(toplam)")
}

func topla1(a: Int, b:Int, c:Int) {
    let toplam = a + b + c
    print("toplam: \(toplam)")
}

func topla1(a: Int, b:Int, c:Int, d:Int) {
    let toplam = a + b + c + d
    print("toplam: \(toplam)")
}

topla1(a: 2,b: 3)
topla1(a: 2,b: 3, c: 4)

//Recursion

var sonuc = 0
func hesapla(a: Int) -> Int {
    
    if (a == 0){
        return 0
    } else {
        sonuc = a + hesapla(a: a-1)
    }
    
    return sonuc
}

let gelenSonuc = hesapla(a: 2)
print("gelenSonuc: \(gelenSonuc)")


//Higher order functions
let degerler = ["bir","iki","uc","dort","bes","alti","yedi","sekiz"]

//tum elemanlari sirasi ile gezer
degerler.forEach { eleman in
    print(eleman)
}

//tum elemanlari gezer ve geriye bir dizi dondurur

var sayac = 0
let yeniDegerler = degerler.map { eleman in
    sayac = sayac + 1
    return eleman + String(sayac)
}


print("yeniDegerler: \(yeniDegerler)")

//sadece degerleri bize verir
let sayilar = ["1","2","uc","4dort","bes5", nil,"6"]

let yeniSayilar = sayilar.compactMap { eleman in
     String(eleman ?? "777")
}

print("yeniSayilar: \(yeniSayilar)")

//elaman dizisini bir karakter dizisine cevirir

var yeniSayac = 0
let degerler2 = degerler.flatMap { eleman in
    yeniSayac = yeniSayac + 1
    return eleman + String(yeniSayac)
}

print("degerler2: \(degerler2)")

//filtreleme yapamayi saglar

let yeniSayilar1 = [1,3,5,12,20,30,4]

let sonuc1 = yeniSayilar1.filter { eleman in
    eleman > 6
}

print("sonuc1: \(sonuc1)")

//reduce -> sayi dizi uzerinden gectikce her birini toplayip deger atar

//sort -> sayi dizisini siralama yapar

let yeniSayilar2 = yeniSayilar1.sorted()
print("yeniSayilar2: \(yeniSayilar2)")


//Closures
let adimiSelamlar = {(ad: String, yas: Int) in
 return "merhaba \(ad) bos geldin, yasin: \(yas)"
}

let selamlamaBitis = adimiSelamlar("memo",20)
print("selamlamaBitis: \(selamlamaBitis)")


let cikarmaYap : (String, String) -> String
cikarmaYap = {$1}


print("cikarmaYap: \(cikarmaYap("10","20"))")


func verileriAl(x: Int, y: Int , kapanma:(Int, Int)->Int) -> Int {
    
    return kapanma(x,y)
}

let veriSonuc = verileriAl(x: 3, y: 4) { ilkDeger, ikinciDeger in
    return ilkDeger + ikinciDeger
}

print("veriSonuc: \(veriSonuc)")


func yeniVeri(isim: String, kapatma:(String) -> String) -> String {
    return kapatma("hosgeldin \(isim)")
}

let islem = yeniVeri(isim: "memo") { cevap in
    return cevap
}

print("islem: \(islem)")


//escaping closure \()

func carpmaYap(x:Int , y: Int, sonucuAl:@escaping (Int) -> Void) {
    let sonuc = x * y
    sonucuAl(sonuc)
}

carpmaYap(x: 4, y: 5) { sonucumuz in
    print("sonucumuz: \(sonucumuz)")
}

//Auto closures

func cikarmaYap(x: Int, y: Int, ekle: @autoclosure() -> Int)  {
    let sonuc = x + y + ekle()
    print("sonucumuz: \(x) \(y) \(sonuc)")
}

cikarmaYap(x: 2, y: 3, ekle: 4 )

//enumerations

enum Gunler: Int{
    case pazartesi
    case sali
    case carsamba = 10
    case persembe = 20
    case cuma
    case cumartesi
    case pazar
}

let bugun: Gunler = Gunler.cumartesi

print("cumartesi degeri \(Gunler.cumartesi.rawValue)")

print("bugun: \(bugun)")

if(bugun == .cumartesi){
    print("tatil gunleri ")
}

enum Ogrenciler{
    case Adi(String)
    case Isaret(Int, Int, Int)
}

var ogrenciDetay = Ogrenciler.Adi("Bilal")
var ogrenciIsaret: Ogrenciler = Ogrenciler.Isaret(40, 50, 60)

switch ogrenciIsaret {
    case .Adi(let ad):
    print(ad)
    case .Isaret(let deger1, let deger2, let deger3):
    print("deger1 \(deger1) deger2: \(deger2) deger3 \(deger3)")
}


//Structures
struct Okul {
     let isim: String
    var yapilisTarihi: Int
    
    func notOrtalamasiHesapla(x:Int, y: Int){
        let ort = (x + y ) / 2
        print("ort: \(ort)")
    }
    
}

var okulum = Okul(isim: "memo", yapilisTarihi: 2020)
okulum.yapilisTarihi = 2024
print("okulum : \(okulum.isim) \(okulum.yapilisTarihi)")
okulum.notOrtalamasiHesapla(x: 40, y: 60)

//Classes
class Ogrenci {
    let ad: String //stored
    let yas: Int // stored
    lazy var ogrenciDurumu = "" // lazy
    
    var aldigiNot = 40 { // 60
        willSet{
            print("deger atanacak \(aldigiNot)" )
        }
        didSet{
            print("deger atandi \(aldigiNot)" )
        }
    }
    var notDurumu: (Int){ //Computed
        get{
            return aldigiNot + 10 // 50
        }
        set(kanaatNotu) {
            aldigiNot = kanaatNotu + aldigiNot
        }
    }
    var geneBilgi: [String: Any]{ //computed
        return [
            "adi": self.ad,
            "yas": self.yas
        ]
    }
    init(isim: String, yasi: Int) {
        self.ad = isim
        self.yas = yasi
        dogumTarihiBul(x: 2024)
        print("ogrenciDurumu: \(ogrenciDurumu)")
        ogrenciDurumu = "gecti"
    }
    func dogumTarihiBul(x: Int) {
        let sonuc = x - yas
        print("sonuc: \(sonuc)")
    }
}
var ogrencim = Ogrenci(isim: "memo", yasi: 30)
print("ad : \(ogrencim.ad) ")
print("gectimi? : \(ogrencim.ogrenciDurumu) ")
print("notDurumu? : \(ogrencim.notDurumu) ")
ogrencim.notDurumu = 20
print("notDurumu? : \(ogrencim.notDurumu) ")
print("geneBilgi? : \(ogrencim.geneBilgi["adi"]!) ")
print("geneBilgi? : \(ogrencim.geneBilgi["yas"]!) ")















