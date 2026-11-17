//
//  ViewController.swift
//  ViewControllerLifecycle
//
//  Created by Zülal Nebin on 17.11.2026.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("first did load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("first did appear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("first disappear")
    }


}

