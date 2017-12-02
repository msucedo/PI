//
//  AsignarDesdeAdminViewController.swift
//  prueba7
//
//  Created by Mario Saucedo on 11/14/17.
//  Copyright © 2017 Mario Ruben Saucedo. All rights reserved.
//

import UIKit
import Firebase

class AsignarDesdeAdminViewController: UIViewController {
    
    @IBOutlet weak var txtIDAsignar: UITextField!
    @IBOutlet weak var lblBtnAsignar: UIButton!
    @IBOutlet weak var txtIDResponsable: UITextField!
    @IBOutlet weak var lblBtnResponsableAsignar: UIButton!
    @IBOutlet weak var lblBtnCancelar: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnCancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAsignarBibliotecario(_ sender: UIButton) {
        var id = txtIDAsignar.text
        //let uid = FIRAuth.auth()?.currentUser?.uid
        //FIRDatabase.database().reference().child("usuarios").child(uid!)
        let ref = FIRDatabase.database().reference()
        let usersReference = ref.child("usuarios").child(id!)
        let values = ["rol": "Bibliotecario"]
        usersReference.updateChildValues(values, withCompletionBlock: {
            (err, ref) in
            
            if err != nil {
                print(err!)
                return
            }else{
                print("rol actualizado con EXITO")
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func btnAsignarResponsable(_ sender: UIButton) {
        var id = txtIDResponsable.text
        //let uid = FIRAuth.auth()?.currentUser?.uid
        //FIRDatabase.database().reference().child("usuarios").child(uid!)
        let ref = FIRDatabase.database().reference()
        let usersReference = ref.child("usuarios").child(id!)
        let values = ["rol": "Responsable"]
        usersReference.updateChildValues(values, withCompletionBlock: {
            (err, ref) in
            
            if err != nil {
                print(err!)
                return
            }else{
                print("rol actualizado con EXITO")
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
}
