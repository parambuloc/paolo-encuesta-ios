//
//  LoginResultadoViewController.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/2/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import UIKit
import CoreData

class LoginResultadoViewController: ResultadosViewController {
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.connectFields(poTextFields: txtUser, txtContraseña)
    }
    
    @IBAction func login(_ sender: Any) {
        if txtUser.text?.trim() != nil && txtUser.text?.trim() != ""{
            if txtContraseña.text?.trim() != nil && txtContraseña.text?.trim() != ""{
                if txtUser.text == "admin@mail.com" {
                    if txtContraseña.text == "123456" {
                        do{
                            let delegado = UIApplication.shared.delegate as! AppDelegate
                            let contexto = delegado.persistentContainer.viewContext
                            let entidad = NSEntityDescription.insertNewObject(forEntityName: "Usuario",into: contexto)
                            entidad.setValue("admin@mail.com",forKey: "usuario")
                            entidad.setValue("123456",forKey: "contrasena")
                            
                            try contexto.save()
                            txtUser.text = ""
                            txtContraseña.text = ""
                            resultados.hideCvLoguearse()
                            self.navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "baseline-power_settings_new-24px")
                        }catch {
                            Util.mostrarAlerta(titulo: "Login", mensaje: "No se pudo resgistrar el usuario", self)
                        }
                    }else {
                        Util.mostrarAlerta(titulo: "Login", mensaje: "Contraseña incorrecta", self)
                    }
                }else {
                    Util.mostrarAlerta(titulo: "Login", mensaje: "Usuario incorrecto", self)
                }
            }else {
                Util.mostrarAlerta(titulo: "Login", mensaje: "Ingrese una contraseña", self)
            }
        }else {
            Util.mostrarAlerta(titulo: "Login", mensaje: "Ingrese un usuario", self)
        }
    }
}

extension LoginResultadoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
