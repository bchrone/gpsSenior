//
//  SalleController.swift
//  EdtUa
//
//  Created by Mr.Link's on 2/21/19.
//  Copyright © 2019 Mr.Link's. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SalleController: UIViewController {

    @IBOutlet weak var i5Btn: UIButton!
    @IBOutlet weak var i4Btn: UIButton!
    @IBOutlet weak var i3Btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paraBoutons()
        
 let ref = Database.database().reference()
 let postRef = ref.child("users").child("SalleI4")
 let postRef2 = ref.child("users").child("SalleI5")
 let postRef3 = ref.child("users").child("SalleI3")

        
        postRef.observe(.childRemoved) { (snapshot) in
            self.i4Btn.backgroundColor = .green
        }
        
        postRef.observe(.childAdded) { (snapshot) in
            self.i4Btn.backgroundColor = .red
        }
        
        postRef2.observe(.childRemoved) { (snapshot) in
            self.i5Btn.backgroundColor = .green
         
        }
        
        postRef2.observe(.childAdded) { (snapshot) in
            self.i5Btn.backgroundColor = .red
        }

        
        
         postRef3.observe(.childRemoved) { (snapshot) in
         self.i3Btn.backgroundColor = .green
         
         }
         
         postRef3.observe(.childAdded) { (snapshot) in
         self.i3Btn.backgroundColor = .red
         }
    
            
        }
    
    //Private func
    private func paraBoutons(){
        
        i5Btn.layer.cornerRadius = 15
        i5Btn.layer.borderWidth = 2
        i5Btn.layer.borderColor = UIColor.red.cgColor
        i5Btn.backgroundColor = UIColor.green
        
        i4Btn.layer.cornerRadius = 15
        i4Btn.layer.borderWidth = 2
        i4Btn.layer.borderColor = UIColor.red.cgColor
        i4Btn.backgroundColor = UIColor.green

        
        i3Btn.layer.cornerRadius = 15
        i3Btn.layer.borderWidth = 2
        i3Btn.layer.borderColor = UIColor.red.cgColor
        i3Btn.backgroundColor = UIColor.green

    }
    
    
    }


