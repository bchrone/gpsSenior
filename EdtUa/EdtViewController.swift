//
//  EdtViewController.swift
//  EdtUa
//
//  Created by Mr.Link's on 2/19/19.
//  Copyright © 2019 Mr.Link's. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class EdtViewController: UIViewController {
    
//Outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var decoBtn: UIButton!
    @IBOutlet weak var dsiBtn: UIButton!
    @IBOutlet weak var iutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        paraBoutons()
        
        if let user = Auth.auth().currentUser{
            
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            
            ref.child("users").child(userID!).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let username = value?["Enseignant"] as? String ?? "Aucun nom d'utilisateur"
                
                self.nameLbl.text = username

            }
            // utilisateur connecté
            
        } else {
            fatalError("Ne fait pas le malin!!!")
        }
        
    }
    //Private func
    private func paraBoutons(){
        dsiBtn.layer.cornerRadius = 20
        dsiBtn.layer.borderWidth = 3
        dsiBtn.layer.borderColor = UIColor.red.cgColor
        
        iutBtn.layer.cornerRadius = 20
        iutBtn.layer.borderWidth = 3
        iutBtn.layer.borderColor = UIColor.red.cgColor
        
        decoBtn.layer.cornerRadius = 15

        
        
    }
    
    //Actions
    @IBAction func decoPressé(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("Impossibke de vous déconnectez")
        }
    }
    

}
