//
//  LogoutViewController.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/2/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit

class LogoutViewController: PerfilViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logout(_ sender: Any) {
        Util.mostrarAlertaAceptarCancelar(titulo: "Cerrar Sesión", mensaje: "¿Seguro que desea cerrar sesión?", self, onAccept: { (_) in
            UserSQLUseCase().deleteUser()
            if UserSQLUseCase().existSession() {
                Util.mostrarAlerta(titulo: "Encuesta", mensaje: "Error al cerrar sesión", self)
            }else {
                perfil.hideCvLogueado()
                self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-input-24px")
                self.navigationController?.tabBarController?.tabBar.items![2].selectedImage = UIImage(named: "baseline-input-24px")
            }
        }, onCancel: nil)
    }

}
