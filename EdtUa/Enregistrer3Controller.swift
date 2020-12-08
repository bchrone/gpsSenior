//
//  Enregistrer3Controller.swift
//  EdtUa
//
//  Created by Mr.Link's on 2/26/19.
//  Copyright © 2019 Mr.Link's. All rights reserved.
//

import UIKit
import Foundation
import FirebaseInstanceID

class Enregistrer3Controller: UIViewController {

    //Outlets
    @IBOutlet weak var matiere3TextF: UITextField!
    @IBOutlet weak var date3TextF: UITextField!
    
    @IBOutlet weak var valider3Btn: UIButton!
    @IBOutlet weak var annuler3Btn: UIButton!
    //Propriétés
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paraBoutons()
        paraTextField()
        
    }
    
    //Private func
    private func paraBoutons(){
        valider3Btn.layer.cornerRadius = 15
        valider3Btn.layer.borderWidth = 3
        valider3Btn.layer.borderColor = UIColor.red.cgColor
        
        annuler3Btn.layer.cornerRadius = 15
        annuler3Btn.layer.borderWidth = 3
        annuler3Btn.layer.borderColor = UIColor.red.cgColor
    }
    
    private func paraTextField(){
        matiere3TextF.delegate = self
        date3TextF.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cacherClavier))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    //Actions
    @objc private func cacherClavier() {
        matiere3TextF.resignFirstResponder()
        date3TextF.resignFirstResponder()
    }
    
    @IBAction func ValiderPressé(_ sender: UIButton) {
        if matiere3TextF.text != "" && date3TextF.text != "" {
            
            let ref = Database.database().reference()
            
            ref.child("users").child("SalleI3").setValue(["matiere": self.matiere3TextF.text!])
            
            ref.child("users").child("SalleI3").setValue(["date": self.date3TextF.text!])
            
            self.performSegue(withIdentifier: "returnSalle", sender: self)
            
        }else {
            
            print("impossible")
            
        }
    }
    @IBAction func AnnulerPressé(_ sender: UIButton) {
        
        let ref = Database.database().reference()
        
        ref.child("users").child("SalleI3").removeValue();
        
        self.performSegue(withIdentifier: "returnSalle", sender: self)
        
    }
}

extension Enregistrer3Controller: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

