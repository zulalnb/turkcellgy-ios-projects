# SwiftyJSONDemo

Bu proje, **Swift Package Manager (SPM)** kullanarak harici bir kütüphanenin iOS projesine nasıl ekleneceğini ve **SwiftyJSON** kütüphanesiyle JSON verilerinin nasıl işleneceğini gösterir.

## Swift Package Manager (SPM)

Uygulama geliştirirken her özelliği veya component'i sıfırdan yazmak yerine, ihtiyaç duyulan işlevleri sağlayan hazır kütüphanelerden yararlanabiliriz. Bu kütüphaneleri projeye eklemeyi, sürümlerini yönetmeyi ve bağımlılıkları çözümlemeyi sağlayan araçlara **paket yöneticisi (package manager)** denir.

iOS geliştirme ekosisteminde CocoaPods, Carthage ve Swift Package Manager gibi farklı paket yöneticileri bulunur.

Swift Package Manager, Swift'in resmi paket yöneticisidir ve Xcode ile entegre çalışır. Harici paketleri doğrudan Xcode üzerinden projeye eklemeyi ve bağımlılık sürümlerini yönetmeyi sağlar.

### 2021'deki eğitim içeriği hakkında

Bu çalışmanın dayandığı eğitim videosu Aralık 2021 tarihlidir. O dönemde CocoaPods, iOS projelerinde sık kullanılan ve yerleşmiş paket yöneticilerinden biriydi. Bu nedenle eğitimde CocoaPods'a ağırlık verilmesi dönemin kullanım alışkanlıklarını yansıtır.

Swift Package Manager ise Swift 3 ile ortaya çıkmış, Xcode 11 ile iOS uygulama projelerinde doğrudan kullanılabilir hâle gelmiştir. Bu projede aynı bağımlılık yönetimi ihtiyacı SPM üzerinden ele alınmıştır.

## SwiftyJSON Paketinin Eklenmesi

Projede JSON verilerini daha kolay okuyup işlemek için [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) kütüphanesi kullanılmıştır.

Xcode üzerinden paket eklemek için:

1. **File → Add Package Dependencies** menüsünü açın.
2. Paket adresini girin: `https://github.com/SwiftyJSON/SwiftyJSON`
3. Sürüm kuralını belirleyin.
4. `SwiftyJSON` ürününü uygulama target'ına ekleyin.

Bu projede sürüm kuralı **Up to Next Major Version** olarak ve başlangıç sürümü `5.0.2` olacak şekilde ayarlanmıştır. Bu kural, 5.x sürümleri içinde güncellemelere izin verir; 6.0.0 sürümüne otomatik geçiş yapmaz.

Paket eklendikten sonra Swift dosyasında aşağıdaki import ifadesiyle kullanılabilir:

```swift
import SwiftyJSON
```

## JSON Verilerinin İşlenmesi

Projede iki farklı JSON yapısı örneklenmiştir:

- **JSON Object:** `firstName` ve `lastName` alanlarını içeren tek bir kişi verisi.
- **JSON Array:** Birden fazla kişiyi içeren JSON dizisi.

JSON string önce UTF-8 formatında `Data` nesnesine dönüştürülür. Ardından SwiftyJSON'ın `JSON` tipiyle işlenir.

Tek bir JSON nesnesindeki alanlara anahtarları üzerinden erişilerek `Person` nesnesine aktarılır. JSON dizisinde ise `arrayValue` kullanılarak elemanlar dolaşılır ve her eleman için bir `Person` nesnesi oluşturulur.

Örneklerde elde edilen kişi isimleri Xcode konsoluna yazdırılır. Proje harici bir API isteği yapmaz; JSON verileri örnek string'ler üzerinden oluşturulur.

## Dikkat Edilmesi Gerekenler

Bir kütüphane seçerken yalnızca sağladığı özelliğe değil, projenin mimarisiyle ve kod alışkanlıklarıyla uyumuna da dikkat edilmelidir. Kütüphanenin güncelliği, dokümantasyonu, bilinen hataları ve bakım durumu incelenmelidir.

Her yayınlanan kütüphane üretim ortamında güvenle kullanılabilecek anlamına gelmez. Projeye eklenen bağımlılıkların kaynağını ve güvenilirliğini kontrol etmek önemlidir.

## Öğrenilen Konular

- Swift Package Manager ile Xcode projesine harici paket ekleme
- Paket sürüm kurallarını anlama
- SwiftyJSON kullanımı
- JSON Object ve JSON Array verilerini işleme
- JSON verilerinden model nesneleri oluşturma

## Kaynaklar

- [Apple Developer – Swift Packages](https://developer.apple.com/documentation/xcode/swift-packages)
- [Apple Developer – Adding Package Dependencies](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)
- [Swift Package Manager Documentation](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs/)
- [SwiftyJSON – GitHub](https://github.com/SwiftyJSON/SwiftyJSON)