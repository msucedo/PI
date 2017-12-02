//
//  DetailsTicketViewController.swift
//  prueba7
//
//  Created by Mario Saucedo on 10/9/17.
//  Copyright © 2017 Mario Ruben Saucedo. All rights reserved.
//

import UIKit
import Firebase

class DetailsTicketViewController: UIViewController {
    
    @IBOutlet weak var regresarLabel: UIButton!
    @IBOutlet weak var fechaGeneradoLabel: UILabel!
    @IBOutlet weak var horaGeneradoLabel: UILabel!
    @IBOutlet weak var RespondidoLabel: UILabel!
    @IBOutlet weak var estadoLabel: UITextField!
    @IBOutlet weak var preguntonLabel: UILabel!
    @IBOutlet weak var idTicketLabel: UILabel!
    @IBOutlet weak var cambiarEstadoBtnlbl: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //fechaTicket()
        estadoTicket()
        pruebaFecha()
        regresarLabel.layer.cornerRadius = 15.0
        cambiarEstadoBtnlbl.layer.cornerRadius = 15.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func regresarButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func fechaTicket() {
        let uid = FIRAuth.auth()?.currentUser?.uid
        FIRDatabase.database().reference().child("preguntas").child(uid!).observe(.value, with: {
            (snapshot) in
            print(snapshot)
            if let dictionary = snapshot.value as? [String: AnyObject] {
                self.fechaGeneradoLabel.text = dictionary["timestamp"] as? String
                print("PRUEBA de fecha funcionando")
            }
            else{
                print("vale madr")
            }
        })
    }
    
    func pruebaFecha() {
        let preguntasDB = FIRDatabase.database().reference().child("preguntas")
        preguntasDB.observe(.childAdded, with: {
            (snapshot) in
            
            let snapshotValue = snapshot.value as? [String: AnyObject]
    
            let sender = snapshotValue?["nombre"]!
            let time = snapshotValue?["timestamp"]!
            let estado = snapshotValue?["estado"]
            
            
            let mensaje = Mensajes()
            mensaje.id = snapshot.key
            let id = mensaje.id
            mensaje.sender = sender as! String
            mensaje.timestamp = time as! NSNumber
            mensaje.estado = estado as! String
            
            self.fechaGeneradoLabel.text = String(format: "%@", time as! CVarArg)
            self.preguntonLabel.text = mensaje.sender
            self.idTicketLabel.text = id
            self.estadoLabel.text = mensaje.estado
            
        }, withCancel: nil)

    }
    
    func estadoTicket() {
        
    }
    
    

}
