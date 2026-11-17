# Xcode Workspace

## Xcode Çalışma Alanı

Xcode, yalnızca kod yazmak veya kullanıcı arayüzü tasarlamak için geliştirilmiş bir araç değildir. Günümüzde mobil uygulama geliştirme sürecindeki güvenlik, test, cihaz yönetimi, harici servis entegrasyonları ve uygulama dağıtımı gibi ihtiyaçlar, kapsamlı bir geliştirme ortamını gerekli hale getirmiştir.

Xcode, iOS uygulamalarının geliştirilmesinden test edilmesine ve App Store'a gönderilmesine kadar birçok aşamada ihtiyaç duyduğumuz araçları tek bir ortamda sunar.

## Kod Yazma ve Düzenleme Özellikleri

### Anahtar Kelime Tespiti ve Syntax Highlighting

Xcode, yazdığımız kodları analiz ederek Swift dilinin anahtar kelimelerini, ifadelerini ve diğer yapılarını tanır.

**Syntax Highlighting**, kod içerisindeki farklı ifadelerin farklı renklerle gösterilmesini sağlar. Böylece değişkenler, anahtar kelimeler, metotlar ve yorum satırları birbirinden kolayca ayırt edilebilir.

Bu özellik, özellikle uzun süre kod yazarken kodun daha kolay okunmasını ve takip edilmesini sağlar.

### IntelliSense (Code Completion)

IntelliSense olarak ifade edilen kod tamamlama ve öneri özellikleri, yazdığımız ifadeye göre kullanabileceğimiz metotları, özellikleri ve diğer kod yapılarını önerir.

Bu sayede:

- Kod yazma hızımız artar.
- Mevcut sınıf ve nesnelerin özelliklerini daha kolay keşfederiz.
- Metot ve özellik isimlerini ezberlemek zorunda kalmayız.
- Yazım hatalarının bir kısmını daha yazma aşamasında önleyebiliriz.

### Derleme ve Hata Kontrolü

Xcode, kod yazarken çeşitli analizler ve hata kontrolleri gerçekleştirerek sorunları tespit etmemize yardımcı olur.

Proje derlendiğinde (Build), yazdığımız kodlar derleyici tarafından kontrol edilir. Derleme sırasında karşılaşılan hatalar ve uyarılar Xcode içerisinde görüntülenir. Bazı hatalar için düzeltme önerileri de sunulur.

## Uygulamayı Çalıştırma

Xcode, derlenen uygulamaların fiziksel cihazlarda veya simülatörlerde çalıştırılmasını sağlar.

Uygulamayı çalıştırmak için hedef cihaz olarak:

- Fiziksel bir iPhone veya iPad
- iOS Simulator

seçilebilir.

Böylece uygulamanın farklı cihaz ve ekran boyutlarında nasıl davrandığını test edebiliriz.

## Hesap ve İmzalama Yönetimi

Xcode, Apple Developer hesabımızı geliştirme ortamına bağlamamıza ve uygulama imzalama işlemlerini yönetmemize yardımcı olur.

Uygulamaların fiziksel cihazlarda çalıştırılması ve App Store'a gönderilmesi gibi süreçlerde sertifikalar (Certificates) ve provisioning profile dosyaları kullanılır.

Xcode'un Automatic Signing özelliği sayesinde bu işlemlerin önemli bir bölümü otomatik olarak yönetilebilir.

**Önemli Not: Xcode'un otomatik imzalama özelliği, Apple Developer Program üyeliğinin yerine geçmez.**

Apple Account sahibi olmak ile Apple Developer Program üyesi olmak aynı şey değildir.

- **Apple Account:** Xcode'u indirip kullanmak, uygulama geliştirmek ve simülatörde test yapmak için ücretli geliştirici üyeliği zorunlu değildir. Temel geliştirme ve kişisel cihazlarda test işlemleri de üyelik olmadan yapılabilir.
- **Apple Developer Program:** Uygulamaları App Store üzerinden dağıtmak, TestFlight kullanmak ve dağıtım için gerekli sertifika, provisioning profile ve App Store Connect özelliklerinden yararlanmak için ücretli üyelik gerekir.
- **Xcode Automatic Signing:** Xcode, uygun hesap ve takım yetkileri bulunduğunda geliştirme ve dağıtım için gerekli sertifika ve provisioning profile işlemlerinin önemli bir kısmını otomatik olarak gerçekleştirebilir. Ancak bu otomasyon, Apple Developer Program üyeliği ve gerekli hesap yetkilerini ortadan kaldırmaz.
- **App Store Connect:** Uygulamanın App Store'a gönderilmesi ve yayın sürecinin yönetilmesi için kullanılır. Xcode üzerinden uygulama yükleyebilmek için App Store Connect tarafında uygulama kaydının ve gerekli kimlik bilgilerinin de bulunması gerekir.

Kısacası Xcode, sertifika oluşturma, uygulama imzalama ve provisioning profile yönetimi gibi işlemleri kolaylaştırır; ancak uygulamanın App Store'da yayınlanması için gereken Apple üyeliği ve App Store Connect süreçleri ayrıca devam eder.

## Kod Kalitesini ve Uygulama Performansını İnceleme

Xcode yalnızca uygulamanın çalışmasını sağlamakla kalmaz; hata ayıklama ve performans inceleme araçlarıyla geliştirdiğimiz uygulamaların kalitesini artırmamıza da yardımcı olur.

### Debugging (Hata Ayıklama)

Debugging, uygulamanın çalışma sürecini adım adım inceleyerek hataların tespit edilmesini sağlar.

Özellikle mantık hatalarında, kod herhangi bir derleme hatası vermese bile beklediğimiz sonucu üretmeyebilir. Bu durumda uygulamanın çalışma sırasında hangi işlemleri gerçekleştirdiğini ve değişkenlerin hangi değerleri aldığını incelememiz gerekir.

Xcode'un Debugger araçları ve Breakpoint özelliği sayesinde:

- Kodun belirli bir satırda durmasını sağlayabiliriz.
- Kodları adım adım çalıştırabiliriz.
- Değişkenlerin ve nesnelerin güncel değerlerini inceleyebiliriz.
- Hatanın hangi aşamada ortaya çıktığını tespit edebiliriz.

### Console (Output Penceresi)

Console, uygulamanın çalışma sırasında ürettiği çıktıları ve hata mesajlarını görüntülememizi sağlar.

`print()` komutuyla kendi çıktı mesajlarımızı oluşturabilir, uygulamanın çalışma sürecini takip edebiliriz.

Bu sayede Breakpoint kullanmadan da uygulamanın belirli aşamalarında neler gerçekleştiğini inceleyebiliriz.

### Components ve Simülatör Yönetimi

Uygulamalarımızı farklı cihazlarda ve iOS sürümlerinde test etmek önemlidir. Ancak farklı fiziksel cihazları sürekli olarak elimizde bulundurmak maliyetli olabilir.

Xcode, sanal cihazlar (Simulators) aracılığıyla bu ihtiyacı karşılar.

Xcode'un Components veya platform yönetimi üzerinden gerekli simülatör bileşenleri ve işletim sistemi sürümleri indirilebilir. Böylece farklı iOS sürümlerinde uygulamalarımızı fiziksel bir cihaza ihtiyaç duymadan test edebiliriz.

### Debug Navigator

Debug Navigator, uygulamanın çalışması sırasında cihaz kaynaklarının nasıl kullanıldığını incelememizi sağlar.

Uygulamanın yalnızca doğru sonuç üretmesi yeterli değildir. Bellek, işlemci ve ağ kullanımı gibi performans kriterleri de kullanıcı deneyimini doğrudan etkiler.

Debug Navigator üzerinden örneğin:

- CPU kullanımı
- Bellek (Memory) kullanımı
- Enerji tüketimi
- Network kullanımı

gibi performans göstergelerini takip edebiliriz.

Böylece gereksiz kaynak tüketimine neden olan işlemleri tespit edebiliriz.

### Debug View Hierarchy

Xcode, yalnızca kodları değil, uygulamanın kullanıcı arayüzünü de incelememizi sağlar.

Debug View Hierarchy özelliği sayesinde uygulamanın o anki View hiyerarşisini görsel olarak inceleyebiliriz.

Bu araçla:

- View nesnelerinin iç içe yerleşimini görebiliriz.
- Arayüz bileşenlerinin konumlarını ve boyutlarını inceleyebiliriz.
- View'lar arasındaki ilişkileri görüntüleyebiliriz.
- Auto Layout ve Constraint kaynaklı sorunların tespitini kolaylaştırabiliriz.

## Uygulamayı Arşivleme ve Dağıtma

### Organizer

Organizer, Xcode içerisinde uygulamaların arşivlerini ve dağıtım süreçlerini yönetmek için kullanılan araçtır.

Bir uygulamayı App Store'a göndermeden önce Archive işlemiyle dağıtıma uygun bir paket oluşturabiliriz.

Organizer üzerinden:

- Oluşturulan Archive kayıtlarını görüntüleyebiliriz.
- Arşivlenmiş uygulama sürümlerini inceleyebiliriz.
- Uygulamayı App Store Connect'e yükleyebiliriz.
- Dağıtım ve arşivleme süreçlerini yönetebiliriz.

Bu sayede uygulamanın geliştirilmesinden dağıtıma hazırlanmasına kadar birçok işlemi Xcode üzerinden gerçekleştirebiliriz.

## Özet

Xcode, iOS uygulama geliştirme sürecinin farklı aşamalarını tek bir ortamda yönetmemizi sağlar.

- **Kod Editörü:** Kod yazma, renklendirme ve otomatik tamamlama
- **Build:** Kodların derlenmesi ve hataların kontrol edilmesi
- **Simulator:** Farklı cihaz ve iOS sürümlerinde test
- **Debugger:** Kodların adım adım incelenmesi
- **Console:** Uygulama çıktılarının ve hata mesajlarının görüntülenmesi
- **Debug Navigator:** Performans ve kaynak kullanımının izlenmesi
- **Debug View Hierarchy:** Kullanıcı arayüzünün ve View hiyerarşisinin incelenmesi
- **Organizer:** Uygulamanın arşivlenmesi ve dağıtımının yönetilmesi

## Referanslar

- [Apple Developer Program – Programs Overview](https://developer.apple.com/help/account/membership/programs-overview/)
- [Certificates Overview](https://developer.apple.com/help/account/certificates/certificates-overview/)
- [Create an App Store Connect Provisioning Profile](https://developer.apple.com/help/account/provisioning-profiles/create-an-app-store-provisioning-profile/)
- [Xcode Automatic Signing](https://developer.apple.com/help/account/provisioning-profiles/create-a-development-provisioning-profile/)