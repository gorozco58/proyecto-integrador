//
//  LoginViewController.swift
//  Bim 360 Plan
//
//  Created by Giovanny Orozco Loaiza on 17/03/20.
//  Copyright © 2020 Autodesk. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var requestIndicatorView: UIActivityIndicatorView!
    
    init() {
        super.init(nibName: String(describing: LoginViewController.self), bundle: nil)
        modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction private func singInPressed() {
        let userName = userNameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if userName != "giovannyorozco24@gmail.com" || password != "123456" {
            showAlert()
        } else {
            requestIndicatorView.startAnimating()
            signInButton.isEnabled = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.requestIndicatorView.stopAnimating()
                self.signInButton.isEnabled = true
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Credenciales incorrectas", preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default) { (action:UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
