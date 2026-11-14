# KeychainBasics

Bu proje, iOS uygulamalarında hassas verilerin güvenli şekilde saklanması için kullanılan **Keychain Services** yapısını tanıtır. Apple'ın `Security` framework'ü kullanılarak Keychain üzerinde parola oluşturma, okuma, güncelleme ve silme işlemleri gerçekleştirilir.

## Keychain Nedir?

Keychain, iOS ve diğer Apple platformlarında parola, erişim token'ı, sertifika ve anahtar gibi hassas bilgileri güvenli şekilde saklamak için kullanılan sistem servisidir.

`UserDefaults` gibi genel uygulama ayarlarını saklamaya yönelik değildir. Özellikle kullanıcı kimlik bilgileri ve erişim token'ları gibi korunması gereken küçük veriler için tercih edilir.

## Keychain İşlemleri

Projede `Security` framework'ü kullanılarak aşağıdaki işlemler gerçekleştirilir:

- **Oluşturma – `SecItemAdd`:** Parola, UTF-8 formatında `Data` nesnesine dönüştürülerek Keychain'e kaydedilir.
- **Okuma – `SecItemCopyMatching`:** Hesap bilgisi (`kSecAttrAccount`) ve kayıt türü (`kSecClassGenericPassword`) kullanılarak ilgili kayıt aranır. `kSecReturnData` ile saklanan veri geri alınır.
- **Güncelleme – `SecItemUpdate`:** Mevcut kayıt sorgulanır ve yeni parola `kSecValueData` aracılığıyla kaydedilir.
- **Silme – `SecItemDelete`:** Belirtilen sorguyla eşleşen Keychain kaydı silinir.

## Uygulama Akışı

İşlemler `ViewController` içerisindeki `viewDidLoad()` metodunda sırasıyla çalıştırılır:

1. `createItem()` ile `userPassword` hesabına ait `123456` parolası Keychain'e eklenir.
2. `readItem()` ile kayıtlı parola okunur ve Xcode konsoluna yazdırılır.
3. `updateItem()` ile parola `12345678` olarak güncellenir.
4. `readItem()` tekrar çağrılarak güncellenmiş parola kontrol edilir.
5. `deleteItem()` ile kayıt Keychain'den silinir.
6. Son olarak `readItem()` çağrılarak silinen kayıt yeniden okunmaya çalışılır.

Keychain işlemlerinin dönüş değerleri `OSStatus` üzerinden kontrol edilir. Böylece işlemin başarılı olup olmadığı takip edilebilir.

## Önemli Kavramlar

- **`Security` Framework:** Keychain Services API'lerine erişim sağlar.
- **`kSecClassGenericPassword`:** Keychain'de genel parola türündeki kayıtları belirtir.
- **`kSecAttrAccount`:** Kaydın hangi hesapla ilişkilendirildiğini tanımlar.
- **`kSecValueData`:** Keychain'e kaydedilecek veriyi belirtir.
- **`OSStatus`:** Keychain işlemlerinin sonuç kodunu temsil eder.

## Kullanılan Teknolojiler

- Swift
- UIKit
- Security Framework
- Keychain Services

## Kaynaklar

- [Apple Developer – Keychain Services](https://developer.apple.com/documentation/security/keychain_services)
- [Apple Developer – Security Framework](https://developer.apple.com/documentation/security)