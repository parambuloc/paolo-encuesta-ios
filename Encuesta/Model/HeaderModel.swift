//
//  HeaderModel.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/4/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation

struct HeaderModel{
    let categoria:Int
    let estado_botón: Bool
    var estado_celda: Bool
    let lista_encuesta: [EncuestaModel]
}
