import UIKit

var greeting = "Hello, playground"


struct Hesap {
    var sayi = 0
    var wrappedValue: Int { //20
        get{
            return sayi
        }
        set {
            sayi = min(newValue, 18)
        }
    }
}

struct Dikdortgen {
   var genislik: Int
   var uzunluk: Int
   var hesap: Hesap
}



var hesap = Hesap()

var obj = Dikdortgen(genislik: 10, uzunluk: 20, hesap: hesap)
print(obj.uzunluk)

obj.uzunluk = 11
print(obj.uzunluk)


/*
 Elinizde bir oku objesi (struct) olsun, icinde ogrenciSayisi, okulAdi ve ayrica kendi icinde ogrenciDetay diye bir objesi(struct) daha olsun. ogrenciDetay icinde ogrenciAdi ve ogrenciNo adinda degiskenlerde olsun. Buna dair struct yapisini yapiniz, degerleri disaridan atayiniz. ve bunlara ulasarak ekrana yazdiriniz
 */

//mutating  -> obje ornegi icerisinde bulunan degeri degistirmek icin
//fonksiyonun basina yazilir. Degistilebilinir demektir.

struct ToplamaYap {
    var deger1 = 1 //10
    var deger2 = 1 //12
    
    func topla() -> Int {
        return deger1 + deger2
    }
    
    mutating func arttir(deger: Int){
         deger1 = deger1 * deger
         deger2 = deger2 * deger
    }
}


var toplamaYap = ToplamaYap(deger1: 10, deger2: 12)

toplamaYap.arttir(deger: 10)

print("sonuc \(toplamaYap.topla())")

//static , class class ile bir obje icindeki fonksiyonlara ornekleme olusturmadan
//direk ulasmayi sagliyor

struct DikdortgenAlani {
    static func alan(uzunluk: Int, derinlik: Int) -> Int {
        return uzunluk * derinlik
    }
   
    func ucgenAlani(taban: Double, height: Double) -> Double {
        return (1 * taban * height) / 2
    }
}


class AlanHesaplama {
    class func ucgenAlani(taban: Double, height: Double) -> Double {
        return (1 * taban * height) / 2
    }
    static func alan(uzunluk: Int, derinlik: Int) -> Int {
        return uzunluk * derinlik
    }
    
}

let dAlani = DikdortgenAlani()
let uAlani = dAlani.ucgenAlani(taban: 10.1, height: 20.2)

let dikdortgenAlani = DikdortgenAlani.alan(uzunluk: 4, derinlik: 2)
print("dAlani \(dikdortgenAlani)")
print("uAlani \(uAlani)")

//subscripts -> bir kolleksiyonu ifade eder ve uzerinden degisiklik yapmayi saglar
struct Cikarma {
    let azaltma: Int // 100
    subscript(sira: Int) -> Int{
        return azaltma / sira
    }
}

let bolme = Cikarma(azaltma: 100)
print(" sonuc: \(bolme[2])")

//Inheritance - Miras alma

class Hayvan{
    var renk: String
    final var ayakSayisi: Int // final olan bir ozellik/metot bir alt sinifta ezilemez yani override edilemez
    
    init(renk:String, ayakSayisi: Int) {
        self.renk = renk
        self.ayakSayisi = ayakSayisi
    }
    
    func beslen() {
        print("hayvan besleniyor")
    }
    
    func yuru() {
        print("hayvan yuruyor")
    }
}

class Aslan: Hayvan{
    var cinsiyet: String

     init(cinsiyet: String, renk: String, ayakSayisi: Int) {
        self.cinsiyet = cinsiyet
         
        super.init(renk: renk, ayakSayisi: ayakSayisi)
    }
    
    func zipla() {
        print("aslan zipliyor")
    }
    
    override func beslen() {
        print("aslan avlaniyor")
    }
}


let hayvan = Hayvan(renk: "sari", ayakSayisi: 4)
print("hayvan: \(hayvan.renk)")
hayvan.beslen()

let aslan = Aslan(cinsiyet: "erkek", renk: "beyaz", ayakSayisi: 2)
print("aslan: \(aslan.ayakSayisi)")
print("aslan: \(aslan.cinsiyet)")
aslan.beslen()
aslan.zipla()
aslan.beslen()

print("aslan: \(aslan.renk)")

/*
Elinizde insan diye bir obje(sinif) olsun, bunun icinde en az 2 adet degisken ve
 2 adet fonksiyon olsun. Daha sonra Erkek diye bir obje olusturarak insan objesinden miras alsin ve bu erkek objesinin icindede en az 1 adet degisken
 ve 1 adet fonksiyon olsun. Ayrica bu erkek objesindeki bir fonksiyon insan objesnin icinde yer alan bir fonksiyonu ezsin.
 erkek objesinin icinde yer alan degiskenleri ekrana yazdiriniz ve icindeki
 fonksiyonlari cagiriniz.
*/
class Insan {
    
    var isim : String
    var yas : Int
    
    init(isim: String, yas: Int) {
        self.isim = isim
        self.yas = yas
    }
    
    func yuru() {
        print("İnsan yürüdü")
    }
    
    func otur() {
        print("İnsan oturdu")
    }
    
}

class Erkek : Insan {
    
    var elSayisi : Int
    
    init(elSayisi: Int, isim : String, yas : Int) {
        self.elSayisi = elSayisi
        super.init(isim: isim, yas: yas)
    }
    
    func fan(){
        print("Galatasaray")
    }
    
    override func yuru() {
        print("GS'li yürüdü")
    }
    
}

var e = Erkek(elSayisi: 2, isim: "Bilal", yas: 25)
print(e.elSayisi)
print(e.isim)
print(e.yas)

e.fan()
e.yuru()


//optional
class UcgenAlani {
    
    var uzunluk: Double? // 40
    
    init(uzunluk: Double?) {
        self.uzunluk = uzunluk
    }
   
}

class AltUcgen: UcgenAlani {
    var genislik: Double // 0
    init(a: Double, b: Double) {
        self.genislik = b
        super.init(uzunluk: a)
    }
    
    // ayni obje icinde bir init cagirilmasi icin kullanilir. Obje orneginden
    //init ten once cagirilabilinir. Kullanimi zorunlu degildir
    convenience init(uzunluk: Double) {
        self.init(a: uzunluk, b: 0.0)
    }
    
}


let ucgenAlani = UcgenAlani(uzunluk: 10)
let altUcgen = AltUcgen(a: 20, b: 30)
let altUcgen1 = AltUcgen(uzunluk: 40)

print("ucgenAlani: \(ucgenAlani.uzunluk!)")
print("ucgenAlani genislik: \(altUcgen.genislik)")
print("ucgenAlani uzunluk: \(altUcgen.uzunluk)")
print("altUcgen1 uzunluk: \(altUcgen1.uzunluk)")
print("altUcgen1 genislik: \(altUcgen1.genislik)")

//Failable init
struct Kisiler {
    let ad: String
    
    //bir obje olusturuken bir hata ile geriye nil donebilir bu durumda
    // failable yani ? ile init olusturmak gerekir
    init?(ad: String){
        if ad.isEmpty { return nil }
        self.ad = ad
    }
}


let kisi = Kisiler(ad: "bilal") // nil  bos olabilirdi ?
print(kisi!.ad)

//required init

class Ogrenci {
    required init() {
        let a = 10
        print("Ogrenci \(a)")
    }
}

class YeniOgrenci: Ogrenci {
    required init() {
        let b = 30
        print("YeniOgrenci \(b)")
    }
    deinit{
        print("YeniOgrenci hafizadan silindi")
    }
}

let ogrenci = Ogrenci() //ARC gider hafizada deger arttirir burasi icin
var yeniOgrenci: YeniOgrenci? = YeniOgrenci()
yeniOgrenci = nil //ARC gider deger siler hafizayi bosaltmak icin

//ARC -> Otomarik Rerefans Sayaci -> Obje referans"larini hafizada deger
//arttiracak mantikta tutar, ve obje silindiginde ise gidip hafizayi bosaltir()
//atadigi degeri alir. Genek de sinif orneklerinde kullanlir.


//String Weak Unowned

class Ogrenciler{
    let ad: String
    var ozelOgrenci: OzelOgrenci?
    
    init(ad: String) {
        print("Ogrenciler hafizaya yerlestir")
        self.ad = ad
    }
    deinit {
        print("Ogrenciler hafizadan silindi")
    }
}


class OzelOgrenci {
    let ad: String
     var ogrenciler: Ogrenciler?
    
    init(ad: String) {
        print("OzelOgrenci hafizaya yerlestir")
        self.ad = ad
    }
    deinit {
        print("OzelOgrenci hafizadan silindi")
    }
}

var ogrenciler: Ogrenciler?
var ozelOgrenci: OzelOgrenci?

ogrenciler = Ogrenciler(ad: "memo")
ozelOgrenci = OzelOgrenci(ad: "can")

ogrenciler!.ozelOgrenci = ozelOgrenci
ozelOgrenci!.ogrenciler = ogrenciler


class Modul {
    let ad: String
    init(ad: String) {
        self.ad = ad
    }
    var altModul: AltModule?
    deinit {
        print("Modul hafizadan silindi")
    }
}

class AltModule {
    let sayi: Int
    init(sayi: Int) {
        self.sayi = sayi
    }
    weak var modul: Modul?
    deinit {
        print("AltModule hafizadan silindi")
    }
}

var modul: Modul?
var altModule: AltModule?

modul = Modul(ad: "memo")
altModule = AltModule(sayi: 20)


modul!.altModul = altModule
altModule!.modul = modul

modul = nil
altModule = nil



class Customer {
    var name: String
    var card: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) müşterisi silindi.")
    }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer

    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }

    deinit {
        print("Kart \(number) silindi.")
    }
}

// Kullanım:
var customer: Customer? = Customer(name: "Ahmet")
customer?.card = CreditCard(number: 1234_5678_8765_4321, customer: customer!)



class Parent {
    var name: String
    var children: [Child] = []

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) ebeveyn bellekten silindi.")
    }
}

class Child {
    var name: String
    weak var parent: Parent?

    init(name: String, parent: Parent?) {
        self.name = name
        self.parent = parent
    }

    deinit {
        print("\(name) çocuk bellekten silindi.")
    }
}

// Kullanım:
var parent: Parent? = Parent(name: "Ali")
var child1 = Child(name: "Ayşe", parent: parent)
var child2 = Child(name: "Ahmet", parent: parent)

// Parent nesnesi çocukları tutuyor.
parent?.children.append(child1)
parent?.children.append(child2)

// Ebeveyn referansı kaldırıldığında, parent ve tüm child nesneleri bellekten temizlenir.
parent = nil


class Customer1 {
    var name: String
    var card: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) müşterisi bellekten silindi.")
    }
}

class CreditCard1 {
    let number: Int
    unowned let customer: Customer  // unowned referans

    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }

    deinit {
        print("Kart numarası \(number) bellekten silindi.")
    }
}

// Kullanım:
var customer1: Customer1? = Customer1(name: "Ahmet")
customer1?.card = CreditCard(number: 1234_5678_8765_4321, customer: customer!)

customer1 = nil  // Customer ve CreditCard bellekten silinir.


