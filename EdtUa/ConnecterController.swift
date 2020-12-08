//
//  ConnecterViewController.swift
//  EdtUa
//
//  Created by Mr.Link's on 2/19/19.
//  Copyright © 2019 Mr.Link's. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConnecterController: UIViewController {

    //outlets
    @IBOutlet weak var emailTextf: UITextField!
    @IBOutlet weak var mdpTextf: UITextField!
    
    @IBOutlet weak var connecterBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        paraBoutons()
        paraTextField()
    }
    //Private func
    private func paraBoutons(){
        connecterBtn.layer.cornerRadius = 20
        connecterBtn.layer.borderWidth = 3
        connecterBtn.layer.borderColor = UIColor.red.cgColor
    }
    
    private func paraTextField(){
        mdpTextf.delegate = self
        emailTextf.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cacherClavier))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    //Actions
    @objc private func cacherClavier() {
        mdpTextf.resignFirstResponder()
        emailTextf.resignFirstResponder()
    }
    @IBAction func retourInscription(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func seConnecter(_ sender: UIButton) {
        if emailTextf.text != "" && mdpTextf.text != "" {
            Auth.auth().signIn(withEmail: emailTextf.text!, password: mdpTextf.text!) { (authResult, error) in
                if error != nil {
                    print(error.debugDescription)
                }else {
                   self.performSegue(withIdentifier: "goToEdt2" , sender: self)
                }
                
            }
        }
    }
    
}

extension ConnecterController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
