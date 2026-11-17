//
//  ViewController.swift
//  OutletActionBasics
//
//  Created by Zülal Nebin on 17.11.2026.
//

import UIKit

// Dokunma ve sürükleme gibi işlemler için action,
// nesnenin değerini okuma ve değiştirme gibi işlemler için outlet
// oluşturuyoruz.

class ViewController: UIViewController {
    
    // MARK: - Outlets

    // Outlet, Storyboard üzerindeki View nesnelerine
    // kod içerisinden erişmemizi sağlar.
    //
    // Bir nesnenin özelliklerini okumak veya değiştirmek
    // istediğimizde IBOutlet bağlantısı oluştururuz.

    // MARK: Memory Management: Weak and Strong

    // strong: Nesneye güçlü bir referans oluşturur ve ARC
    // tarafından nesnenin bellekte tutulmasını sağlar.
    //
    // weak: Nesneyi bellekte tutmaz. Referans verilen nesne
    // bellekten kaldırıldığında otomatik olarak nil olur.
    //
    // IBOutlet bağlantılarında genellikle weak kullanılır.
    // Çünkü Storyboard tarafından oluşturulan View hiyerarşisi,
    // alt View nesnelerini zaten strong referanslarla tutar.
    //
    // Böylece View Controller'ın ayrıca güçlü bir referans
    // oluşturmasına gerek kalmaz.
    //
    // Not: weak kullanımı viewDidUnload ile ilişkili değildir.
    // viewDidUnload eski iOS sürümlerinde kullanılan ve
    // iOS 6 ile birlikte kullanımdan kaldırılan bir metottur.
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        
        // View hiyerarşisinin yüklenmesi ve IBOutlet
        // bağlantılarının kurulması tamamlanmıştır.
        // Bu aşamada UI bileşenlerine erişebiliriz.
        
        textLabel.text = "Değiştirildi"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    // MARK: - Actions

    // Action, kullanıcı etkileşimleri sonucunda çalıştırılan
    // metottur. Örneğin butona dokunulduğunda tetiklenir.
    //
    // IBOutlet nesneye erişmemizi sağlarken,
    // IBAction kullanıcı etkileşimlerini karşılar.
    @IBAction func buttonTapped(_ sender: Any) {
        textLabel.textColor = .red
    }
    

}

