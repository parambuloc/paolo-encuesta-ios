//
//  Util.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/2/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation
import UIKit

class Util{
    typealias completion = ((UIAlertAction) -> Swift.Void)?
    
    static func mostrarAlerta(titulo: String, mensaje: String, _ viewcontroller: UIViewController){
        let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        ventana.addAction(actionOk)
        viewcontroller.present(ventana, animated: true, completion: nil)
    }
    
    static func mostrarAlertaAceptarCancelar(titulo: String, mensaje: String, _ viewcontroller: UIViewController, onAccept: Util.completion, onCancel: Util.completion){
        let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Aceptar", style: .destructive, handler: onAccept)
        let actionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: onCancel)
        ventana.addAction(actionCancelar)
        ventana.addAction(actionOk)
        viewcontroller.present(ventana, animated: true, completion: nil)
    }
}
