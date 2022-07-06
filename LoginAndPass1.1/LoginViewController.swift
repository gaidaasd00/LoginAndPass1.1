//
//  ViewController.swift
//  LoginAndPass1.1
//
//  Created by Алексей Гайдуков on 06.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = "Gaida"
    private let password = "Asd123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    @IBAction func loginPress() {
        guard userNameTF.text == user, passwordTF.text == password else {
            showAlert(title: "Invalid login or password",
                      messege: "Please enter correct login and password",
                      textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        
    }
    
    @IBAction func forgotPassAndLogin(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ooops!", messege: "Your name \(user)")
        : showAlert(title: "Ooops!", messege: "Your password \(password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    

    private func showAlert(title: String, messege: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}

