import UIKit

var greeting = "Hello, playground"

//weak
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


/*
 Ali ebeveyn bellekten silindi.
 Ayşe çocuk bellekten silindi.
 Ahmet çocuk bellekten silindi.
*/

//unowned
class Customer {
    var name: String
    var card: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) müşterisi bellekten silindi.")
    }
}

class CreditCard {
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
var customer: Customer? = Customer(name: "Ahmet")
customer?.card = CreditCard(number: 1234_5678_8765_4321, customer: customer!)

customer = nil  // Customer ve CreditCard bellekten silinir.


//ERROR -> hata isimlerdirmek ve ozellestirmeyi saglayan bir siniftir. Miras alinir

enum Hatalarim: Error {
    case gecersizIcerik
    case dosyaBulunumadi
    case agHatasi
}

//try da bir kod denendiginde ve fonksiyonda hata bilerek firlatmak icin, fonksiyon devamina throws yazilir. ve fonksiyon icinde throw yazilip yanina firlatilacak sey yazilir
func veriIsle(_ deger: String) throws {
    guard !deger.isEmpty else {
        throw Hatalarim.gecersizIcerik // return
    }
    print("veriIslendi")

}

// do icinde kodu calistir ve eger hata olursa catch ile yakala. Varsayilan hata adi error dur catch icinde yazdirmak icin ama let ile hata adi ozellestirilebilinir
do {
    try veriIsle("")
    print("Basarilir")
} catch Hatalarim.gecersizIcerik {
    print("icerik gecersiz")
} catch {
    print("beklenmedik hata \(error)")
}

//Iflet ile eger gelen veri bos degilse = in sol tarafina atama olur ve optional ozelligi solda kalkmis olur
func hesapla(deger: Int?) {
    if let yeniDeger = deger {
        print("gelenDeger \(yeniDeger)")
    }
    print("deger her durumda \(deger)")
    
}

hesapla(deger: 1)

//Concurrency   1- asycn await   sirali olarak bir is bittikten sonra diger ise gecilmesini saglar
/*
func rastgeleSayiOlustur() async -> Int {
    Int.random(in: 10...40)
}

let sonuc = await rastgeleSayiOlustur()
print("sonuc1: \(sonuc)")
*/
// 2- Task-Gorev  / Task Group- Gorev grubu

class GorevYonetimi {
    private var gorev: DispatchWorkItem? //iptal, baslatma, durdurma
    
    func goverOlustur() {
        print("goverOlustur basladi")
        gorev = DispatchWorkItem {
            print("gorev DispatchWorkItem atandi")
            for i in 1...10{
                if self.gorev?.isCancelled ?? false {
                    print("Gorev iptal edildi")
                }
                print("Gorev devam ediyor . \(i)")
                
            }
            print("Gorev basari ile tamamlandi")
            
        }
        //arkaplanda kodu calistir
        DispatchQueue.global().async(execute: self.gorev!) // GCD - Grand Central Dispatch --- global arkaplanda isi yap --- async sirali olarak calistir --- main de ise onplanda islem yapilir
        
       
    }
    
    func goreviIptalEt() {
        print("goreviIptalEt basladi")
        //gorev iptal ediliyor
        gorev?.cancel()
    }

}

let gorevimiz = GorevYonetimi()

//gorev olustur calissin
gorevimiz.goverOlustur()

//2 saniye uyut
// sleep(5) -> belirtilen sayi yani saniye cinsinden programi bekletmeyi saglar

//gorevi iptal et
gorevimiz.goreviIptalEt()


//up-casting -> ust siniftan gelen ozelliklere alt sinif objesi ile ulasma, degisken tipini ust siniftaki olarak belirtmek gerekir
class Sekil {
    func goster() {
        print("top bir yuvarlak kure seklidir")
    }
}

class Dikdortgen: Sekil {
    func goruntule() {
        print("dikdortgen en cok kullanilan sekildir")
    }

}

let nesne: Sekil = Dikdortgen()
nesne.goster()

//down-casting  as?  - bu sekilde yapilir //alt sinifta kendisine ait yer alan ozellikler/fonksiyonlara ve ust siniftan gelen bu ozelliklere ulasilmasini saglar. as! ile ise kesin down-casting yapilir
let nesne2: Sekil = Dikdortgen()


if let sonucumuz = nesne2 as? Dikdortgen{
    sonucumuz.goruntule()
}

let sonucumuz1 = nesne as! Dikdortgen
sonucumuz1.goruntule()

if nesne2 is Sekil { // is ile bir nesnes tipi saglamasi yapilabilinir
    print("nesne2 tipi Sekil dir")
}

if sonucumuz1 is Dikdortgen {
    print("sonucumuz1 tipi Dikdortgen dir")
}


//Extensions - enum, class, struct "lar uzerinden miras almadan ozellikler eklenilmesini saglar
extension Int{
    var ekle: Int {return self + 100}
    var cikar: Int {return self - 10}
}

let ekleme = 4.ekle + 3.cikar
print(ekleme)

struct HesapMakinasi {
    var sayi1 = 100, sayi2 = 200
    func topla() -> Int {
        return sayi1 + sayi2
    }
    
}

extension HesapMakinasi{
    func carp(a: Int, b:Int) -> Int {
        return a*b
    }
}

let hesapM = HesapMakinasi()
print("carpmaSonucu \(hesapM.carp(a: 2,b: 3))")
print("toplamaSonucu \(hesapM.topla())")

//Protocol -> Kendi icinde metotlar yazabildigimiz yapilardir. Ozellikle onceki sayfalara veri gonderme durumunuda veya bir seyi haber etmede kullanilir. Protocol metotlarinin body kismini impelemete ettigin sinifta belirtirsin.

protocol Haberci {
    var ilkSayi: Int {get set}
    var sonucu: Bool { get }
    
    func hesap1() -> String
    func hesap2(altDeger: Int) -> String
    func hesap3(b: String) -> Void
   
}

class Sinif1: Haberci {
    var ilkSayi: Int = 0
    var sonucu: Bool
    
    let sinif2: Sinif2 = Sinif2()
    init() {
        sonucu = true
        ilkSayi = 4
    }
    
    func hesap1() -> String {
        return "hesapsiz"
    }
    
    func hesap2(altDeger: Int) -> String {
        let sonuc =  String(altDeger * 3)
        return sonuc
    }
    func hesap3(b: String) {
        print(" hesap3 gelen deger \(b)")
    }
    
    func kendiniReferansGoster(){
        sinif2.haberci = self
    }
    
    func islemYapCagir() {
        sinif2.islemYap(x: "10")
    }
}

open class Sinif2{
    var haberci: Haberci? = nil

    func islemYap(x: String) {
        print(" islemYap calistir")
        haberci?.hesap3(b: x)
    }
}

fileprivate let sinif1 = Sinif1()
sinif1.kendiniReferansGoster()
sinif1.islemYapCagir()

//inout - fonksiyon icine gonderilen parametrenin disaridan erisilebilinir olmasini sagliyor

func degistir( a: inout Int, b: inout Int) {
    a = a + 20
    b = b - 10
}

var sayi1 = 100
 var sayi2 = 200
print("sayi1 \(sayi1) sayi2 \(sayi2)")
degistir(a: &sayi1, b: &sayi2)
print("sayi1 \(sayi1) sayi2 \(sayi2)")

//generics - gonderilen veri tipi T ile on belirtim yapmadan yani mesela Int String gibi veya kendi olusturdugumuz obje tiplerinide direk olarak vermeden, elimizdeki yapiyi kullanmaya basladigimiz andan itibaren tipleri belirtebilir olmamizi sagliyor

struct ListeOlustur<T> {
    var elemenlar = [T]()
    
    mutating func ekle(eleman: T){
        elemenlar.append(eleman)
    }
    
    mutating func cikar() -> T?{
        return elemenlar.popLast() // son elemani cikar
    }
    
}


var liste = ListeOlustur<String>()
liste.ekle(eleman: "ceylan")
liste.ekle(eleman: "hatice")
liste.ekle(eleman: "sabri")

liste.cikar()
print(liste.elemenlar)


func goster<T: CustomStringConvertible>(eleman: T){
    print(eleman.description)
}

let icerik = "burasi isvec"
let sayi = 24

goster(eleman: icerik)
goster(eleman: 25)


// where anahtar kelimesi ile belirtilen kuralin saglanip saglanmadigini kontrol edebiliriz. Bu genellikle fonksiyonlarda belirtilen protocol un saglanip saglanmamasi durumu icin kullanilir
 let sayilar = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Çift sayıları yazdır
for sayi in sayilar where sayi % 2 == 0 {
    print("\(sayi) çift sayıdır")
}


// Generik bir fonksiyon tanımlayalım ve burada where ile Equatable protokolünü sağlayan türleri kısıtlayalım
 func elemanBul<T: Collection>(koleksiyon: T, eleman: T.Element) -> Bool where T.Element: Equatable { // Equatable 2 objeyi karsilastirabilir olmayi saglar
    for item in koleksiyon {
        print("itemmmm \(item)")
        if item == eleman {
            return true // Eleman bulundu
        }
    }
    return false // Eleman bulunamadı
}

// Kullanım:
public let sayilarimiz = [1, 2, 3, 4, 5]
private let sonuclarimiz = elemanBul(koleksiyon: sayilarimiz, eleman: 3)

print(sonuclarimiz) // Çıktı: true

/*
 ERISIM BELIRLEYICILERI
 
 open - siniflara kullabilirsin. Sinif veya bir alt miras verdigi yerde ulasabilir ve override yapilabilinir(genelde framworklerde kullanilir)
 public - her yerden belirtilen ozellige erisebilinir, ama override edilemez
 internal - belirtilen modulede ki tum dosyalar/kaynak icinde erisilebilinir oluyor (Eger hic bir sey yazmazsak erisim belirleyicisi olarak internal olur, varsayilan budur)
 fileprivate - belirtilen kaynak icinde kullanilmasini saglar(ayni dosya icinde bulunan tum yapilardan erisilebilinir)
 private - belirtilen sayfa/kaynak icinde erisilebilinir(mesela bir sinif icinde ise sadece o dosya/sayfa/kaynak icinde bulunan o sinifta kullanilir)
 */
