//
//  ViewController.swift
//  ThemeUserDefaults
//
//  Created by Zülal Nebin on 5.11.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // Ekranda koyu tema ve açık temanın seçilmesini sağlayacak buton olacak.
    // Bu butonlar aracılığı ile kullanıcı uygulamasının temasını seçebilecek.
    // Uygulama açıldığında kullanıcının teması ne ise arkaplan ona göre renklenecek.
    // Varsayılan tema, açık renk tema olacaktır.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyTheme()
    }
    
    @IBAction func btnDarkMode_TUI(_ sender: Any) {
        saveTheme(theme: "dark")
    }
    
    
    @IBAction func btnLightMode_TUI(_ sender: Any) {
        saveTheme(theme: "light")
    }
    
    
    func saveTheme(theme: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(theme, forKey: "theme")
        
        applyTheme()
    }
    
    func applyTheme() {
        let userDefaults = UserDefaults.standard
        let selectedTheme = userDefaults.string(forKey: "theme") ?? "light"
        
        switch selectedTheme {
        case "dark":
            view.backgroundColor = .black
            
        case "light":
            view.backgroundColor = .white
            
        default:
            view.backgroundColor = .white
        }
    }
    
}

