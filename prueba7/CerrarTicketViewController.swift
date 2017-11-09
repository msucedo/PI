//
//  CerrarTicketViewController.swift
//  prueba7
//
//  Created by Mario Saucedo on 10/24/17.
//  Copyright © 2017 Mario Ruben Saucedo. All rights reserved.
//

import UIKit
import Firebase

class CerrarTicketViewController: UIViewController {

    var comentario = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        calificarTicket()
        cerrarTicket()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calificarTicket() {
        
        let alertController = UIAlertController(title: "Calificame!", message: "¿Como estuvo mi servicio?", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.text = ""
        }
        
        alertController.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: {[weak alertController](_) in
            //let textField = alertController?.textFields![0]
            print("prueba de alert")
            self.dismiss(animated: true, completion: nil)
        }))
        
        let OKAction = UIAlertAction(title: "Enviar", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            self.performSegue(withIdentifier: "goToMainMenu2", sender: self)
            
        }
        
        let CancelarAction = UIAlertAction(title: "Cancelar", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            self.performSegue(withIdentifier: "goToRightMenu", sender: self)
            
        }
        
        
        alertController.addAction(OKAction)
        
        
        self.present(alertController, animated: true, completion:nil)
        
    }
    
    func cerrarTicket() {
        var id = ""
        let mensaje = Mensajes()
        
        let preguntasDB1 = FIRDatabase.database().reference().child("historial")
        let preguntasDB = FIRDatabase.database().reference().child("preguntas")
        preguntasDB.observe(.childAdded, with: {
            (snapshot) in
            
            let snapshotValue = snapshot.value as? [String: AnyObject]
    
            
            mensaje.id = snapshot.key
            let time = snapshotValue?["timestamp"]!
            mensaje.timestamp = time as! NSNumber
            id = mensaje.id!
            
        })
        let id2 = id
        let timestamp = NSDate().timeIntervalSince1970
        
        let preguntasDictionary = ["nombre": FIRAuth.auth()?.currentUser?.email!, "Ticket": id2, "estado": "Cerrado", "motivo": "desconocido", "hora Creado": mensaje.timestamp, "hora cerrado": timestamp] as [String : Any]
        
        preguntasDB1.childByAutoId().setValue(preguntasDictionary) {
            (error, ref) in
            
            if error != nil{
                print(error!)
            }
            else{
                print("ticket cerrado")
            }
        }
    }

}
