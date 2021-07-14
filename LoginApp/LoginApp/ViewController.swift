//
//  ViewController.swift
//  LoginApp
//
//  Created by Тадевос Курдоглян on 14.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeText ?? "")"
    }
    
    @IBAction func logoutTapped() {
        dismiss(animated: true)
    }
    
    
}
