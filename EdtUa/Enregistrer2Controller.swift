//
//  Enregistrer2Controller.swift
//  EdtUa
//
//  Created by Mr.Link's on 2/26/19.
//  Copyright © 2019 Mr.Link's. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Enregistrer2Controller: UIViewController {

    //Outlets
    @IBOutlet weak var matiere2TextF: UITextField!
    @IBOutlet weak var date2TextF: UITextField!
    
    @IBOutlet weak var valider2Btn: UIButton!
    @IBOutlet weak var annuler2Btn: UIButton!
    //Propriétés
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paraBoutons()
        paraTextField()
        
    }
    
    //Private func
    private func paraBoutons(){
        valider2Btn.layer.cornerRadius = 15
        valider2Btn.layer.borderWidth = 3
        valider2Btn.layer.borderColor = UIColor.red.cgColor
        
        annuler2Btn.layer.cornerRadius = 15
        annuler2Btn.layer.borderWidth = 3
        annuler2Btn.layer.borderColor = UIColor.red.cgColor
    }
    
    private func paraTextField(){
        matiere2TextF.delegate = self
        date2TextF.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cacherClavier))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    //Actions
    @objc private func cacherClavier() {
        matiere2TextF.resignFirstResponder()
        date2TextF.resignFirstResponder()
    }
    
    @IBAction func ValiderPressé(_ sender: UIButton) {
        if matiere2TextF.text != "" && date2TextF.text != "" {
            
            let ref = Database.database().reference()
            
            ref.child("users").child("SalleI5").setValue(["matiere": self.matiere2TextF.text!])
            
            ref.child("users").child("SalleI5").setValue(["date": self.date2TextF.text!])
            
            self.performSegue(withIdentifier: "returnSalle", sender: self)
            
        }else {
            
            print("impossible")
            
        }
    }
    @IBAction func AnnulerPressé(_ sender: UIButton) {
        
        let ref = Database.database().reference()
        
        ref.child("users").child("SalleI5").removeValue();
        
        self.performSegue(withIdentifier: "returnSalle", sender: self)
        
    }
}

extension Enregistrer2Controller: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

