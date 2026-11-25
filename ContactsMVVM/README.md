# Contacts MVVM

Bu proje, iOS uygulamalarında **MVVM (Model-View-ViewModel)** mimarisinin temel kullanımını göstermek amacıyla hazırlanmıştır. Kişi bilgileri Model katmanında tanımlanır, ViewModel katmanında yönetilir ve UIKit kullanılarak ekranda listelenir.

## MVVM Nedir?

MVVM, uygulamanın sorumluluklarını üç ayrı katmana bölen bir mimari yaklaşımdır:

- **Model:** Uygulamanın veri yapısını ve temel veri nesnelerini temsil eder.
- **View (View Controller):** Kullanıcının göreceği veya etkileşimde bulunacağı kullanıcı arayüzünü temsil eder.
- **ViewModel:** Model verilerini View tarafından kullanılabilecek şekilde hazırlar ve View ile Model arasındaki iletişimi yönetir.

![MVVM Mimarisi](./assets/mvvm-architecture.jpg)

Basitçe MVVM yapısını, sınıf ve struct'ların yaptıkları işe ve sorumluluklarına göre gruplandırılması olarak düşünebiliriz. UI ile ilgili kodları View Controller içerisinde tutarken, veriyle ilgili sunum ve yönetim işlemlerini ViewModel içerisinde gerçekleştiririz. Böylece her katman kendi sorumluluğuna odaklanır ve kodun daha düzenli, anlaşılır ve bakımı kolay hale gelmesi sağlanır.

### Model

Uygulamanın kullandığı veriyi ve veri yapısını temsil eder. Bu projede `Contact` modeli, kişilere ait ad ve soyad bilgilerini tutar.

### View (View Controller)

Kullanıcının göreceği veya etkileşimde bulunacağı işlemleri yönetir. Arayüz bileşenlerinin oluşturulması, kullanıcı etkileşimlerinin karşılanması ve verilerin ekranda gösterilmesi bu katmanın sorumluluğundadır.

### ViewModel

Model ile iletişim kurar ve Model'den aldığı verileri View'ın kullanabileceği şekilde hazırlar. View'ın ihtiyaç duyduğu sunum mantığını yöneterek View Controller'ın veri işlemlerinden mümkün olduğunca bağımsız kalmasını sağlar.

## Proje Yapısı

```text
ContactsMVVM
├── assets
│   └── mvvm-architecture.jpg
├── Model
│   └── Contact.swift
├── View
│   └── ViewController.swift
└── ViewModel
    └── ContactViewModel.swift
```

### Model – Contact

`Contact` modeli, kişilere ait temel bilgileri tanımlar:

- `firstName`: Kişinin adı
- `lastName`: Kişinin soyadı

Model katmanı yalnızca verinin yapısını temsil eder.

### ViewModel – ContactViewModel

Projede iki ayrı ViewModel yapısı bulunur:

**ContactViewModel**
- Bir `Contact` nesnesini kapsar.
- `firstName` ve `lastName` özelliklerini View katmanına sunar.

**ContactsViewModel**
- Kişi listesini `contacts` dizisinde tutar.
- `contactCount` ile listedeki kişi sayısını sağlar.
- `contactViewModel(at:)` ile belirtilen indeksteki kişi için ViewModel oluşturur.
- `populateContacts()` ile örnek kişi verilerini listeye ekler.

Böylece ViewController, kişi verilerinin nasıl oluşturulduğu ve yönetildiğiyle doğrudan ilgilenmek zorunda kalmaz.

### View – ViewController

`ViewController`, kullanıcı arayüzünü ve `UITableView` işlemlerini yönetir.

- `viewDidLoad()` içerisinde `populateContacts()` çağrılarak örnek kişiler yüklenir.
- `UITableViewDataSource` protokolü kullanılarak liste verileri hazırlanır.
- `numberOfRowsInSection` ile satır sayısı ViewModel'den alınır.
- `cellForRowAt` içerisinde ilgili kişinin ViewModel nesnesi alınır ve adı soyadı hücreye aktarılır.
- `reloadData()` çağrısıyla TableView yenilenir.

Hücreler `UITableViewCell` ve `defaultContentConfiguration()` kullanılarak oluşturulur.

## Veri Akışı

1. ViewController, ekrana yüklendiğinde `ContactsViewModel` üzerinden örnek kişi verilerini oluşturur.
2. ViewModel, kişi kayıtlarını `Contact` model nesneleri olarak saklar.
3. UITableView, satır sayısını öğrenmek için ViewModel'in `contactCount` özelliğini kullanır.
4. Her satır için `contactViewModel(at:)` çağrılır.
5. ViewModel, ilgili kişinin ad ve soyad bilgilerini View katmanına sunar.
6. ViewController, bu bilgileri UITableView hücresinde gösterir.

## Kullanılan Teknolojiler

- Swift
- UIKit
- MVVM Mimarisi
- UITableView
- Model, View ve ViewModel katmanları
- Storyboard

## Öğrenilen Konular

- MVVM mimarisinin temel prensipleri
- Model ve ViewModel sorumluluklarının ayrılması
- ViewModel üzerinden verilerin View katmanına sunulması
- UITableView ile ViewModel entegrasyonu
- ViewController'ın sorumluluklarının sınırlandırılması