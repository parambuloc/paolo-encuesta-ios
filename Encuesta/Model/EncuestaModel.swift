//
//  Encuesta.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/4/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation

struct EncuestaModel{
    let categoria:Int
    let nombre:String
    let apellido:String
    let fecha_nacimiento:String
    let correo:String
    let dni:String
    let porque:String
    
    init(categoria: Int, nombre: String, apellido: String, fecha_nacimiento: String, correo: String, dni: String, porque:String){
        self.categoria = categoria
        self.nombre = nombre
        self.apellido = apellido
        self.fecha_nacimiento = fecha_nacimiento
        self.correo = correo
        self.dni = dni
        self.porque = porque
    }
}
