//
//  TransferirTicketViewController.swift
//  prueba7
//
//  Created by Mario Saucedo on 10/24/17.
//  Copyright © 2017 Mario Ruben Saucedo. All rights reserved.
//

import UIKit

class TransferirTicketViewController: UIViewController {

    @IBOutlet weak var transferirBtnlbl: UIButton!
    @IBOutlet weak var cancelarBtnlbl: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transferirBtnlbl.layer.cornerRadius = 15.0
        cancelarBtnlbl.layer.cornerRadius = 15.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelarButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    

}
