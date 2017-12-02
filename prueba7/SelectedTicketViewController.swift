//
//  SelectedTicketViewController.swift
//  prueba7
//
//  Created by Mario Saucedo on 10/7/17.
//  Copyright © 2017 Mario Ruben Saucedo. All rights reserved.
//

import UIKit
import Firebase

class SelectedTicketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var moreOptionsButton: UIBarButtonItem!
    @IBOutlet weak var heightContraint: NSLayoutConstraint!
    @IBOutlet weak var SelectedTicketTableView: UITableView!
    @IBOutlet weak var respuestaTxtLabel: UITextField!
    @IBOutlet weak var enviarBtnLabel: UIButton!
    
    
    var preguntasArray :  [Mensajes] = [Mensajes]()
    var prueba = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        
        SelectedTicketTableView.delegate = self
        SelectedTicketTableView.dataSource = self
        
        SelectedTicketTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        confiTableView()
        ticketSeleccionado()
        mostrarRespuesta()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus() {
        if revealViewController() != nil {
                      
            revealViewController().rightViewRevealWidth = 125
            
            moreOptionsButton.target = revealViewController()
            moreOptionsButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = preguntasArray[indexPath.row].pregunta
        cell.senderUsername.text = preguntasArray[indexPath.row].sender
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preguntasArray.count
    }
    
    func confiTableView() {
        SelectedTicketTableView.rowHeight = UITableViewAutomaticDimension
        SelectedTicketTableView.estimatedRowHeight = 120.0
    }

    
    func ticketSeleccionado() {
        let preguntasDB = FIRDatabase.database().reference().child("preguntas")
        preguntasDB.observe(.childAdded, with: {
            (snapshot) in
            
            let snapshotValue = snapshot.value as? [String: AnyObject]
            
            let text = snapshotValue?["pregunta"]!
            let sender = snapshotValue?["nombre"]!
           
            
            let mensaje = Mensajes()
            mensaje.id = snapshot.key
            self.prueba = snapshot.key
            mensaje.pregunta = text as! String
            mensaje.sender = sender as! String
            
            self.preguntasArray.append(mensaje)
            
            self.confiTableView()
            self.SelectedTicketTableView.reloadData()
            
            
        }, withCancel: nil)
    }
    
    func mostrarRespuesta() {
        let preguntasDB = FIRDatabase.database().reference().child("respuestas")
        preguntasDB.observe(.childAdded, with: {
            (snapshot) in
            
            let snapshotValue = snapshot.value as? [String: AnyObject]
            
            let text = snapshotValue?["respuesta"]!
            let sender = snapshotValue?["nombre"]!
            
            
            let mensaje = Mensajes()
            mensaje.id = snapshot.key
            self.prueba = snapshot.key
            mensaje.pregunta = text as! String
            mensaje.sender = sender as! String
            
            self.preguntasArray.append(mensaje)
            
            self.confiTableView()
            self.SelectedTicketTableView.reloadData()
            
            
        }, withCancel: nil)
    }
    
    @IBAction func enviarRespuestaButton(_ sender: UIButton) {
        respuesta()
    }
    
    
    func respuesta() {
        
        let respuestasDB = FIRDatabase.database().reference().child("respuestas")
        
        let timestamp = NSDate().timeIntervalSince1970
        let destino = prueba
        let respuestasDictionary = ["nombre": FIRAuth.auth()?.currentUser?.email!, "respuesta": respuestaTxtLabel.text!, "estado": "En proceso", "destinatario": destino, "timestamp": timestamp, "calificación": "null"] as [String : Any]
        
        
        respuestasDB.childByAutoId().setValue(respuestasDictionary) {
            (error, ref) in
            
            if error != nil{
                print(error!)
            }
            else{
                print("respuesta guardada con exito")
                self.respuestaTxtLabel.text = ""
            }
        }
        
        //cambiandoEstado()
    }
    
    func cambiandoEstado() {
        //var id = asignarTxtLabel.text
        //let uid = FIRAuth.auth()?.currentUser?.uid
        //FIRDatabase.database().reference().child("usuarios").child(uid!)
        let ref = FIRDatabase.database().reference()
        let usersReference = ref.child("preguntas")
        let values = ["estado": "En proceso"]
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
