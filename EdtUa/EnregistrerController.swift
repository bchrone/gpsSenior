//
//  EnregistrerController.swift
//  EdtUa
//
//  Created by Mr.Link's on 2/22/19.
//  Copyright © 2019 Mr.Link's. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EnregistrerController: UIViewController {

    //Outlets
    @IBOutlet weak var matiereTextF: UITextField!
    @IBOutlet weak var dateTextF: UITextField!
    
    @IBOutlet weak var validerBtn: UIButton!
    @IBOutlet weak var annulerBtn: UIButton!
    //Propriétés
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paraBoutons()
        paraTextField()
        
    }
    
    //Private func
    private func paraBoutons(){
        validerBtn.layer.cornerRadius = 15
        validerBtn.layer.borderWidth = 3
        validerBtn.layer.borderColor = UIColor.red.cgColor
        
        annulerBtn.layer.cornerRadius = 15
        annulerBtn.layer.borderWidth = 3
        annulerBtn.layer.borderColor = UIColor.red.cgColor
    }
    
    private func paraTextField(){
        matiereTextF.delegate = self
        dateTextF.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cacherClavier))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    //Actions
    @objc private func cacherClavier() {
        matiereTextF.resignFirstResponder()
        dateTextF.resignFirstResponder()
    }
    
  @IBAction func ValiderPressé(_ sender: UIButton) {
        if matiereTextF.text != "" && dateTextF.text != "" {

            let ref = Database.database().reference()
            
            ref.child("users").child("SalleI4").setValue(["matiere": self.matiereTextF.text!])
            
            ref.child("users").child("SalleI4").setValue(["date": self.dateTextF.text!])
            
            self.performSegue(withIdentifier: "returnSalle", sender: self)
            
        }else {
            
            print("impossible")
            
        }
    }
  @IBAction func AnnulerPressé(_ sender: UIButton) {
    
    let ref = Database.database().reference()
    
    ref.child("users").child("SalleI4").removeValue();
    
    self.performSegue(withIdentifier: "returnSalle", sender: self)
        
    }
}

extension EnregistrerController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

