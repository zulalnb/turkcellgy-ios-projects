# Turkcell Geleceği Yazanlar — Swift ile iOS Programlama

Bu repository, **Turkcell Geleceği Yazanlar Swift ile iOS Programlama** eğitimleri kapsamında geliştirilen örnek iOS uygulamalarını içerir.

Her uygulama, eğitimlerde ele alınan konuları pratik olarak uygulamak amacıyla oluşturulmuş bağımsız bir Xcode projesidir. Projeler, eğitim seviyelerine ve ilgili ders konularına göre organize edilmiştir.

**Eğitim Kaynağı:** [Swift ile iOS Programlama – Turkcell Geleceği Yazanlar](https://gelecegiyazanlar.turkcell.com.tr/egitimler/swift-ile-ios-programlama)

## Eğitimler

| Eğitim | Açıklama |
| --- | --- |
| [iOS Programlama 101](#ios-programlama-101) | Giriş, tasarım işlemleri, standart yapılar ve kullanımları |
| [iOS Programlama 201](#ios-programlama-201) | Listeleme yapıları, özel hücre tasarımı ve Collection View kullanımı |
| [iOS Programlama 301](#ios-programlama-301) | Veri saklama, dosya yönetimi, JSON işleme, Firebase, konum ve uygulama mimarisi |

## iOS Programlama 101

101 eğitimi kapsamında geliştirilen uygulamalar ve ilgili ders konuları aşağıda listelenmiştir.

| Uygulama | Ders konusu |
| --- | --- |
| [Login UI](LoginUI/) | Constraints Lab - 1 |
| [Calculator UI](CalculatorUI/) | Constraints Lab - 2 |
| [Localization](LocalizationTutorial/) | Çoklu Dil Desteği |
| [Assets Tutorial](AssetsTutorial/) | Assets Lab |
| [XIB Tutorial](XIBTutorial/) | Custom Tasarım XIB |
| [View Segue Tutorial](ViewSegueTutorial/) | View Katmanı - Segue Kullanımı |
| [Tabbar Controller Tutorial](TabbarControllerTutorial/) | Tabbar Controller |
| [Event Time Tracker](EventTimeTracker/) | Outlet - Action Lab - 1 |
| [Login Validation](LoginValidation/) | Outlet - Action Lab - 2 |
| [User Data Transfer](UserDataTransfer/) | Ekranlar Arası Veri Aktarımı Lab |
| [Navigation Controller Tutorial](NavigationControllerTutorial/) | Navigation Controller ile Geçişlerin Yönetilmesi |
| [Programmatic Login UI](ProgrammaticLoginUI/) | AutoLayout Code Lab |
| [Custom Tabbar Controller](CustomTabbarController/) | Custom Tabbar Lab |
| [Timer Tutorial](TimerTutorial/) | Timer |
| [Camera Permissions](CameraPermissions/) | Kamera İzin Kontrol Lab |

### Ele Alınan Konular

- Auto Layout ve Constraints ile arayüz oluşturma
- Programmatic UI geliştirme
- XIB ile özel görünüm oluşturma
- Assets ve çoklu dil desteği
- Segue, Navigation Controller ve Tab Bar Controller kullanımı
- IBOutlet ve IBAction bağlantıları
- Form doğrulama ve ekranlar arası veri aktarımı
- Timer kullanımı
- Kamera izinlerinin yönetimi

## iOS Programlama 201

201 eğitimi kapsamında geliştirilen uygulamalar ve ilgili ders konuları aşağıda listelenmiştir.

| App | Konu |
| --- | --- |
| [Table View Item List](TableViewItemList/) | ViewController TableView Lab |
| [Custom Person Table View](CustomPersonTableView/) | Custom Cell Xib Lab |
| [Product Collection View](ProductCollectionView/) | Collection View Lab |
| [Article Explorer](ArticleExplorer/) | Bölüm Sonu Lab |

### Ele Alınan Konular

- UITableView ile listeleme
- UITableViewDataSource ve UITableViewDelegate
- Custom UITableViewCell tasarımı
- XIB kullanarak özel hücre oluşturma
- UICollectionView ile koleksiyon tabanlı listeleme
- Arama ve filtreleme
- Pagination (sayfalı veri yükleme)

## iOS Programlama 301

301 eğitimi kapsamında geliştirilen uygulamalar ve ilgili ders konuları aşağıda listelenmiştir.

| App | Konu |
| --- | --- |
| [Theme User Defaults](ThemeUserDefaults/) | User Defaults Lab |
| [Todo List Core Data](TodoListCoreData/) | Core Data |
| [Contact Manager Core Data](ContactManagerCoreData/) | Core Data Lab |
| [File Manager Basics](FileManagerBasics/) | Dosya Yönetimi |
| [Swifty JSON Demo](SwiftyJSONDemo/) | CocoaPods Lab |
| [Service Hub](ServiceHub/) | Firebase Lab |
| [Maps Basics](MapsBasics/) | İleri Lokasyon İşlemleri |
| [Keychain Basics](KeychainBasics/) | Keychain İşlemleri |
| [Notification Center Basics](NotificationCenterBasics/) | Notification Center İşlemleri |
| [Contacts MVVM](ContactsMVVM/) | Contacts |

### Ele Alınan Konular

- UserDefaults kullanarak kullanıcı tercihlerini ve tema ayarlarını saklama
- Core Data ile kalıcı veri saklama ve CRUD işlemleri
- FileManager ile dosya ve dizin işlemlerini yönetme
- SwiftyJSON kullanarak JSON verilerini ayrıştırma ve model nesnelerine dönüştürme
- Üçüncü taraf kütüphaneleri projeye entegre etme
- Firebase Authentication ile kullanıcı kaydı oluşturma
- Firebase Realtime Database üzerinden veri okuma ve yazma
- Core Location ile cihaz konumunu ve konum izinlerini yönetme
- MapKit ve Google Maps SDK ile harita görüntüleme ve konum işaretleme
- Keychain Services kullanarak hassas verileri güvenli şekilde saklama ve yönetme
- NotificationCenter ile uygulama içi bildirimleri ve sistem olaylarını dinleme
- UserNotifications framework ile yerel bildirim oluşturma
- MVVM mimarisi ile Model, View ve ViewModel sorumluluklarını ayırma
- UITableView ve ViewModel entegrasyonu

## Projeleri Açma

Her uygulama, kendi klasöründe bağımsız bir `.xcodeproj` dosyası olarak bulunur.

Bir uygulamayı incelemek veya çalıştırmak için ilgili klasördeki Xcode projesi açılabilir. Uygulamalara ait açıklamalar ve ekran görüntüleri kendi README dosyalarında yer alır.