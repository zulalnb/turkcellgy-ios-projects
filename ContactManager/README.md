# Contact Manager

Swift ve UIKit kullanılarak geliştirilen bu proje, Core Data ile kişi bilgilerinin kalıcı olarak saklanmasını ve yönetilmesini amaçlayan bir kişi rehberi uygulamasıdır.

Kullanıcılar kişi ekleyebilir, mevcut kişileri düzenleyebilir ve listeden silebilir. Kişiler adlarına göre alfabetik sıralanır.

## Ekran Görüntüleri

<table>
  <tr>
    <td align="center" width="50%">
      <img src="./screenshots/home.png" alt="Kişi listesi" width="300" />
      <br />
      <strong>Kişi Listesi</strong>
    </td>
    <td align="center" width="50%">
      <img src="./screenshots/contact-form.png" alt="Kişi ekleme ve düzenleme formu" width="300" />
      <br />
      <strong>Kişi Formu</strong>
    </td>
  </tr>
</table>

## Özellikler

- Kişi ekleme, düzenleme ve silme
- Ad, soyad ve e-posta bilgilerini saklama
- Kişileri alfabetik sıralama
- Boş form alanlarını kontrol etme
- Core Data ile kalıcı veri saklama

## Core Data

Core Data, iOS uygulamalarında verileri yönetmek ve kalıcı olarak saklamak için kullanılan bir framework'tür.

Bu projede `ContactManagerCoreData.xcdatamodeld` içerisinde `Contact` Entity'si tanımlanmıştır.

| Attribute | Type |
|---|---|
| `firstName` | String |
| `lastName` | String |
| `email` | String |

Temel Core Data bileşenleri:

- **NSPersistentContainer:** Core Data stack ve persistent store yönetimini sağlar.
- **NSManagedObjectContext:** Veri ekleme, güncelleme ve silme işlemlerinin yönetildiği çalışma alanıdır.
- **NSFetchRequest:** Kayıtları sorgulamak için kullanılır.
- **NSSortDescriptor:** Kayıtları belirli bir alana göre sıralar.

## Kişi Yönetimi

Uygulamada temel CRUD işlemleri gerçekleştirilir:

| İşlem | Açıklama |
|---|---|
| Create | Yeni kişi kaydı oluşturma |
| Read | Kişileri Core Data'dan getirip listeleme |
| Update | Mevcut kişinin bilgilerini düzenleme |
| Delete | Kişiyi listeden silme |

### Formun Yeniden Kullanılması

Kişi ekleme ve düzenleme işlemleri aynı `ContactFormViewController` ekranı üzerinden gerçekleştirilir.

- Yeni kişi eklenirken `contact` değeri nil olur ve yeni kayıt oluşturulur.
- Mevcut kişi düzenlenirken ilgili Contact nesnesi ekrana aktarılır ve form alanları mevcut bilgilerle doldurulur.

Kaydetme işleminden sonra değişiklikler `saveContext()` ile kalıcı veri deposuna aktarılır.

### Listeleme ve Sıralama

Kişiler `UITableView` içerisinde görüntülenir. `NSFetchRequest` ile getirilen kayıtlar, `NSSortDescriptor` kullanılarak adlarına göre alfabetik sıralanır.

Kişi ekleme veya düzenleme ekranından dönüldüğünde `viewWillAppear()` içerisinde `fetchContacts()` çağrılır.

**Neden fetch ve reloadData birlikte kullanılır?**

- `fetch()`: Core Data'dan güncel kişi kayıtlarını getirerek `contacts` dizisini günceller.
- `reloadData()`: Güncellenen veri kaynağını kullanarak UITableView'in görünümünü yeniler.

`reloadData()` tek başına Core Data'dan yeni kayıt getirmez. Yalnızca mevcut veri kaynağındaki verileri yeniden görüntüler. Bu nedenle önce `fetch()`, ardından `reloadData()` kullanılır.

## Uygulama Akışı

1. Uygulama açıldığında kayıtlı kişiler Core Data'dan alınır.
2. Kişiler alfabetik olarak listelenir.
3. Artı butonuyla yeni kişi formu açılır.
4. Liste içerisindeki bir kişiye dokunularak düzenleme ekranına geçilir.
5. Formdaki bilgiler kontrol edilerek kaydedilir.
6. Hücre sola kaydırılarak silme işlemi başlatılabilir.

## Proje Yapısı

```text
ContactManagerCoreData/
├── ContactManagerCoreData.xcodeproj/
└── ContactManagerCoreData/
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    ├── ViewController.swift
    ├── ContactFormViewController.swift
    ├── ContactManagerCoreData.xcdatamodeld/
    ├── Assets.xcassets/
    └── Base.lproj/
        └── Main.storyboard
```

## Kullanılan Teknolojiler

- Swift
- UIKit
- Core Data
- UITableView
- NSPersistentContainer
- NSManagedObjectContext
- NSFetchRequest
- NSSortDescriptor
- Storyboard

## Öğrenilen Konular

- Core Data ile veri kalıcılığı
- Entity ve Attribute kavramları
- Core Data CRUD işlemleri
- Veri sorgulama ve sıralama
- UITableView ile listeleme
- Ekranlar arası veri aktarımı
- Aynı form ekranının ekleme ve düzenleme amacıyla kullanılması
- Form doğrulama
- fetch() ve reloadData() arasındaki fark