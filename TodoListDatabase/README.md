# Todo List Database

Swift ve UIKit kullanılarak geliştirilen bu proje, Core Data ile veri saklama ve yönetme işlemlerini göstermek amacıyla hazırlanmıştır.

Uygulamada Todo kayıtları oluşturulur, okunur, güncellenir ve silinir (CRUD).

## Core Data Destekli Xcode Projesi Oluşturma

Yeni bir Xcode projesi oluştururken Core Data desteği başlangıçta eklenebilir.

1. Xcode menüsünden **File → New → Project** seçilir.
2. Platform olarak **iOS**, template olarak **App** seçilir.
3. Proje adı ve diğer proje ayarları belirlenir.
4. Proje seçenekleri ekranında **Use Core Data** seçeneği etkinleştirilir.
5. Proje oluşturulur.

Bu seçenek etkinleştirildiğinde Xcode, Core Data altyapısı için gerekli başlangıç dosyalarını ve `.xcdatamodeld` uzantılı Data Model dosyasını oluşturur.

### Mevcut Bir Projeye Core Data Ekleme

Core Data desteği başlangıçta eklenmemişse mevcut projeye de eklenebilir:

1. **File → New → File** seçilir.
2. iOS platformu altında **Core Data → Data Model** seçilir.
3. Data Model dosyasına bir isim verilir.
4. Projeye eklendikten sonra Core Data stack yapılandırılır. Bunun için `NSPersistentContainer` oluşturulup persistent store yüklenmelidir.

Sadece Data Model dosyası oluşturmak Core Data kullanımını tamamlamaz. Veri işlemlerinin gerçekleştirilebilmesi için Core Data stack'in de yapılandırılması gerekir.

## Core Data Nedir?

Core Data, iOS uygulamalarında verileri yönetmek ve kalıcı olarak saklamak için kullanılan bir framework'tür.

Kullanıcı bilgileri, uygulama ayarları, yapılacaklar listeleri ve ilişkili veri modelleri gibi bilgilerin yönetilmesinde kullanılabilir.

Core Data yalnızca bir veritabanı aracı değildir; nesne grafiği ve veri kalıcılığı yönetimi de sağlar.

## Temel Kavramlar

**Entity ve Attribute**

Core Data'da saklanacak verilerin yapısı `.xcdatamodeld` dosyasında tanımlanır.

Bu projede `Todo` Entity'si oluşturulmuştur:

| Attribute | Type |
|---|---|
| `title` | String |
| `content` | String |

Entity, saklanacak nesnenin yapısını; Attribute ise nesnenin özelliklerini tanımlar.

**NSPersistentContainer**

Core Data altyapısının temel bileşenlerini yönetir. Data Model ve persistent store yükleme işlemlerini bir araya getirir.

```swift
let container = NSPersistentContainer(name: "TodoListCoreData")
container.loadPersistentStores { _, error in
    if let error = error {
        fatalError("Unresolved error: \(error)")
    }
}
```

**NSManagedObjectContext**

Core Data nesneleri üzerinde ekleme, güncelleme ve silme işlemlerinin gerçekleştirildiği çalışma alanıdır.

Bu projede `persistentContainer.viewContext` kullanılarak context'e erişilir.

## CRUD İşlemleri

CRUD, veri yönetiminin dört temel işlemidir.

| İşlem | Açıklama |
|---|---|
| Create | Yeni kayıt oluşturma |
| Read | Kayıtları okuma |
| Update | Mevcut kaydı güncelleme |
| Delete | Kaydı silme |

### Create – Veri Ekleme

Yeni bir `Todo` nesnesi oluşturulur, attribute değerleri atanır ve context'e eklenir.

```swift
let todo = Todo(context: context)
todo.title = "Alışveriş"
todo.content = "Market alışverişini tamamla"

saveContext()
```

### Read – Veri Okuma

`NSFetchRequest`, Core Data içerisindeki kayıtları sorgulamak için kullanılır.

```swift
let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
let todos = try context.fetch(fetchRequest)
```

### Update – Veri Güncelleme

Önce ilgili kayıt bulunur, ardından nesnenin özellikleri değiştirilir.

```swift
todo.title = "Güncellenmiş başlık"
saveContext()
```

### Delete – Veri Silme

Silinmek istenen nesne context üzerinden kaldırılır.

```swift
context.delete(todo)
saveContext()
```

## Veri Sorgulama ve Filtreleme

Belirli koşullara uyan kayıtları getirmek için `NSPredicate` kullanılır.

```swift
fetchRequest.predicate = NSPredicate(
    format: "title = %@",
    "Alışveriş"
)
```

Bu sorgu, başlığı `Alışveriş` olan kayıtları getirir.

Birden fazla koşul `AND` ile birleştirilebilir. Sıralama için ise `NSSortDescriptor` kullanılır.

```swift
fetchRequest.sortDescriptors = [
    NSSortDescriptor(key: "title", ascending: true)
]
```

## saveContext() Nedir?

Context içerisindeki değişikliklerin kalıcı veri deposuna kaydedilmesini sağlar.

```swift
func saveContext() {
    let context = persistentContainer.viewContext

    if context.hasChanges {
        do {
            try context.save()
        } catch {
            print("Kaydetme hatası: \(error)")
        }
    }
}
```

Yeni kayıt ekleme, güncelleme ve silme işlemlerinden sonra değişikliklerin kalıcı hale gelmesi için context kaydedilmelidir.

## Uygulama Akışı

Uygulama açıldığında `viewDidLoad()` içerisinde CRUD işlemleri örnek olarak sırasıyla çalıştırılır:

1. Todo kaydı oluşturulur.
2. Kayıtlar okunur.
3. Bir kaydın başlığı güncellenir.
4. Güncel kayıtlar tekrar okunur.
5. Güncellenen kayıt silinir.
6. Son durum tekrar okunur.

İşlem sonuçları Xcode konsoluna yazdırılır.

## Proje Yapısı

```text
TodoListCoreData/
├── TodoListCoreData.xcodeproj/
└── TodoListCoreData/
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    ├── ViewController.swift
    ├── TodoListCoreData.xcdatamodeld/
    ├── Assets.xcassets/
    └── Base.lproj/
```

## Kullanılan Teknolojiler

- Swift
- UIKit
- Core Data
- NSPersistentContainer
- NSManagedObjectContext
- NSFetchRequest
- NSPredicate
- NSSortDescriptor

## Öğrenilen Konular

- Core Data'nın temel çalışma mantığı
- Xcode projesine Core Data desteği ekleme
- Data Model ve Entity oluşturma
- Persistent Container ve Managed Object Context
- CRUD işlemleri
- Veri sorgulama ve filtreleme
- Kayıtları sıralama
- Context değişikliklerini kaydetme

## Notlar

Bu proje, Core Data'nın temel kullanımını göstermek amacıyla hazırlanmıştır. İşlemler uygulama açıldığında otomatik olarak gerçekleştirilir ve sonuçlar konsolda görüntülenir. Kullanıcı etkileşimli bir Todo List arayüzü bulunmamaktadır.

## Kaynak

- [Apple Developer – Creating a Core Data Model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)