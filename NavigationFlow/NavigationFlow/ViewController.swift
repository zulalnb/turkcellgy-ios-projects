//
//  ViewController.swift
//  NavigationFlow
//
//  Created by Zülal Nebin on 17.11.2026.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateProgrammaticallyButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showGreenScreen", sender: nil)
    }


}

