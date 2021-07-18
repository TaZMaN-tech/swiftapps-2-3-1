//
//  ViewController.swift
//  LoginApp
//
//  Created by Тадевос Курдоглян on 14.07.2021.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var nameText: String!
    var surnameText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(nameText ?? "") \(surnameText ?? "")"
    }
    
    @IBAction func logoutTapped() {
        dismiss(animated: true)
    }
    
    
}
