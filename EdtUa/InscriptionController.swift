//
//  ViewController.swift
//  EdtUa
//
//  Created by Mr.Link's on 2/17/19.
//  Copyright © 2019 Mr.Link's. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class InscriptionController: UIViewController  {
    
    //Outlets
    @IBOutlet weak var inscrireBouton: UIButton!
    @IBOutlet weak var connecterBouton: UIButton!
    
    @IBOutlet weak var enseignantTextF: UITextField!
    @IBOutlet weak var mdpTextF: UITextField!
    @IBOutlet weak var emailTextF: UITextField!
    
    //Propriétés

    override func viewDidLoad() {
        super.viewDidLoad()
        
        paraBoutons()
        paraTextField()
        
    }

    //Private func
    private func paraBoutons(){
        inscrireBouton.layer.cornerRadius = 20
        
        connecterBouton.layer.cornerRadius = 20
        connecterBouton.layer.borderWidth = 3
        connecterBouton.layer.borderColor = UIColor.red.cgColor
        }
    
    private func paraTextField(){
        enseignantTextF.delegate = self
        mdpTextF.delegate = self
        emailTextF.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cacherClavier))
        view.addGestureRecognizer(tapGesture)

            }
    
    //Actions
    @objc private func cacherClavier() {
        enseignantTextF.resignFirstResponder()
        mdpTextF.resignFirstResponder()
        emailTextF.resignFirstResponder()
    }
    
    @IBAction func inscrirePressé(_ sender: UIButton) {
        if enseignantTextF.text != "" && emailTextF.text != "" && mdpTextF.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextF.text!, password: mdpTextF.text!) { (authResult, error) in
                if error != nil {
                    print(error.debugDescription)
                } else {
                    print("Inscription de \(self.enseignantTextF.text ?? "no name") réussie")
                    
                    let ref = Database.database().reference()
                    let userID = Auth.auth().currentUser?.uid
                    
                    ref.child("users").child(userID!).setValue(["Enseignant": self.enseignantTextF.text!])
                    
                    self.performSegue(withIdentifier: "goToEdt", sender: self)
                }
            }
            
        } else {
            
        }
    }
    @IBAction func connecterPressé(_ sender: UIButton) {
        
    }
}

extension InscriptionController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
    }
}

