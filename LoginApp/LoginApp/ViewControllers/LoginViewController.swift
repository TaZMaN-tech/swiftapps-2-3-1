//
//  ViewController.swift
//  LoginApp
//
//  Created by Тадевос Курдоглян on 14.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: -IB Outlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: -Private Properties
    private let user = User.getUser()
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    // MARK: -Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        loginTextField.delegate = self
        passwordTextField.delegate = self
        loginTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    //MARK: -Navigations
    override func shouldPerformSegue(withIdentifier identitifier: String, sender: Any?) -> Bool {
        guard  identitifier == "HomeSegue" else { return true }
        
        if !validateCredentials() {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            self.passwordTextField.text = ""
        }
        return validateCredentials()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabbarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabbarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? UserViewController {
                welcomeVC.nameText = user.person.name
                welcomeVC.surnameText = user.person.surname
            } else if let navigationVC = viewController as? UINavigationController {
                let personInfoVC = navigationVC.topViewController as! PersonInfoViewController
                personInfoVC.nameText = user.person.name
                personInfoVC.surnameText = user.person.surname
                personInfoVC.ageText = String(user.person.age)
                personInfoVC.professionText = user.person.profession
                personInfoVC.hobbyText = user.person.hobby
                personInfoVC.moreInfo = user.person.moreInfo
            }
        }
    }
    
    
    //MARK: -IB ACtions
    @IBAction func showCorrectLogin(_ sender: Any?) {
        showAlert(title: "Oops!", message: "Your name is \(user.login) 🙄")
    }
    @IBAction func showCorrectPassword(_ sender: Any?) {
        showAlert(title: "Oops!", message: "Your password is \(user.password) 🙄")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    //MARK: -Keyboard Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if passwordTextField.isEditing && shouldPerformSegue(withIdentifier: "HomeSegue", sender: nil) {
            performSegue(withIdentifier: "HomeSegue", sender: nil)
        }
        passwordTextField.becomeFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        loginTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }

    //MARK: -Private Methods
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func validateCredentials() -> Bool {
        return loginTextField.text == user.login && passwordTextField.text == user.password
    }
    
    
}

// MARK: - Set background color
extension UIView {
   
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
