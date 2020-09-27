//
//  ViewController.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    var goToHome: () -> Void = { print("goToHome not overridden") }
    @IBOutlet private weak var homeButton: UIButton!
    @IBAction func goToHomeTapped(_ sender: Any) {
        goToHome()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    deinit {
           print("--- \(self) deinit")
       }
}

