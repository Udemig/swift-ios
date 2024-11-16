import UIKit

//DEGISKENLER
var isim = "memo" // string
isim = "can"

print("isim: \(isim)")

let yas = 30 // int

print("yas: \(yas)")

var ulke="isvec", boy=177

let firatinAnaDili = "turkce"
print("firatinAnaDili: \(firatinAnaDili)")


// \t \n

/*
 var ile degisebilir degisken tanimladik
 let ile sabit degiskenler tanimladik
 */

// OPERATORLER
///matematiksel + - / *

let sayi1 = 4
let sayi2 = 2

print("sayi1: \(sayi1)  -     sayi2: \(sayi2)")

let toplam = sayi1 + sayi2
print("toplam: \(toplam)")

let cikarma = sayi1 - sayi2
print("cikarma: \(cikarma)")

let carpma = sayi1 * sayi2
print("carpma: \(carpma)")

let bolme = sayi1 / sayi2
print("bolme: \(bolme)")

let modu = sayi1 % sayi2
print("mod: \(modu)")


/// mantiksal < <= > => == === ! !=

if(sayi1 > sayi2){
    print("sayi1 sayi2 den buyuktur")
}

if(sayi1 >= 4){
    print("sayi1 4ten buyuk veya esittir")
}

if(sayi2 < sayi1){
    print("sayi2 sayi1 den kucuktur")
}

if(sayi2 <= 2){
    print("sayi2 2den kucuk veya esittir")
}

if(sayi1 != sayi2){
    print("sayi1 sayi2 ye esit degildir")
}

if(sayi1 == 4){
    print("sayi1 4 tur")
}

if(sayi1 == 4 && sayi2 == 2 ){
    print("sayi1 4tur ve sayi2 2 dir")
}

if(sayi1 == 4 || sayi2 == 4){
    print("sayi1 veya sayi2 4tur")
}

var sonuc = 4

sonuc = sonuc + 2 //6
print("sonuc: \(sonuc)")

sonuc+=3 // sonuc = sonuc + 3
print("sonuc: \(sonuc)")

sonuc-=4
print("sonuc: \(sonuc)")

sonuc*=5
print("sonuc: \(sonuc)")

sonuc/=5
print("sonuc: \(sonuc)")

sonuc%=2 // sonuc = sonuc % 2
print("sonuc: \(sonuc)")


let genelSonuc = sayi1 > 3  ? "gecerli" : "gecersiz"

print("genelSonuc: \(genelSonuc)")

//VERI TIPLERI
/// Int 32, Float 32, Double 64, Bool true/false, String , Character, Optional

let fiyat: Float = 23.4 // UInt  + Int - +
let havaYagmurluMu: Bool = true // 1

print("havaYagmurluMu: \(havaYagmurluMu)")
print("fiyat: \(fiyat)")

var sinavSonucu = String("40")
print("sinavSonucu: \(sinavSonucu)")

let ilkHar: Character = "A"
print("ilkHar: \(ilkHar)")

typealias metin = String

var soyadi: metin = "14"
print("soyadi: \(soyadi)")

//OPTIONAL
var anlikDeger: Int?
print("anlikDeger: \(String(describing: anlikDeger))")

anlikDeger = 12
print("anlikDeger: \(anlikDeger!)")

//TUPLES
var bilgiler = ("bilal", "sahin", 30, 180)

print("bilgiler: \(bilgiler)")
print("bilgiler 0: \(bilgiler.0)")
print("bilgiler 1: \(bilgiler.1)")

//Karar Yapicilar

// if elseif else
let sayiA = 3
let SayiB = 4

print("sayiA: \(sayiA) -  SayiB: \(SayiB)")
if(sayiA == 4){
    print("sayiA 4 tur")
} else {
    print("sayiA 4 degildir")
}

if(sayiA == 4){
    print("sayiA 4 tur")
} else if(sayiA == 3){
    print("sayiA 3 tur")
} else{
    print("sayiA ne 3 nede 4 tur")
}

/// switch case

let gun = 3
switch gun {
    case 0,1:
    print("pazartesi")
    break
    case 2:
    print("sali")
    break
    case 3:
    print("carsamba")
    fallthrough
    case 4:
    print("persembe")
    break
    default:
    print("bilinmeyen gun")
}


//LOOP

//for in
for x in 1...8{
    if (x==3) {
        continue
    }
    if (x==5) {
        break
    }
    print("x: \(x)")
}

//while
var sayac = 1
while(sayac < 5){
    print("sayac: \(sayac)")
    sayac = sayac + 1
}

//repat while

var yeniSayac = 2
repeat{
    print("yeniSayac: \(yeniSayac)")
    yeniSayac = yeniSayac + 1
}while(yeniSayac < 5)

//ARRAY

var sayilar:[Int] = [10,7,4,12,34]
sayilar[0] = 20
sayilar.append(44)
var isimler = Array(repeating: "can", count: 3) // ["can","can","can"]

print("sayilar 0: \(sayilar[0]) \(sayilar[1])")
print("sayilar: \(sayilar)")

print("isimler: \(isimler)")
print("isimler count: \(isimler.count)")

sayilar.forEach { deger in
    print("deger: \(deger)")
}

//Set
var genelbilgi = Set<String>()
genelbilgi.insert("can")
genelbilgi.insert("bir")


print("genelbilgi: \(genelbilgi)")


for (sira,icerik) in sayilar.enumerated(){
    
    print("sira: \(sira) icerik \(icerik)")
}

for(sira,icerik) in genelbilgi.enumerated(){
    print("sira: \(sira) icerik \(icerik)")
}

//dictionaries
var sinifListesi = [3:"can", 5:"ceylan", 6:"firat", 7:"bilal"]

print("sinifListesi: \(sinifListesi) ")
sinifListesi[5] = "ayyildiz"
print("sinifListesi 5: \(sinifListesi[5]!) ")

for anahtar in sinifListesi.keys{
    print("anahtar : \(anahtar) ")
}
    

for anahtar in sinifListesi.values{
    print("anahtar : \(anahtar) ")
}

print("sinifListesi count: \(sinifListesi.count) ")

/*
 elinizde hazir bir kullanici adi ve sifre vardir. Eger bu
 kullanici adi ve sifre if karsilastirmasinda dogru ise log
 atarak hosgeldiniz yazin degilse bilgiler yanlis yaziniz.
 
 */

//FONKSIYONLAR

func toplamaYap() {
    let ilkSayi = 2
    let ikinciSayi = 4
    let toplamlari = ilkSayi + ikinciSayi
    print("toplamlari \(toplamlari)")
}


toplamaYap()

func cikarmaYap(a:Int,b:Int) {
    let sonuc = a - b
    print("sonuc \(sonuc)")
}


cikarmaYap(a: 4, b: 2)

func carpmaYap(x:Int, y:Int) -> Int {
  let sonuc = x * y
    return sonuc
}


let gelenSonuc = carpmaYap(x: 3, y: 5)
print("gelenSonuc \(gelenSonuc)")

let carpmamiz:(Int, Int) -> Int = carpmaYap

print("carpmamiz \(carpmamiz(4,5))")





