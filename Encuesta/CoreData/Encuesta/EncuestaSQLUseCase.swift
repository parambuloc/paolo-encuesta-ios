//
//  EncuestaSQLUseCase.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/4/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation

class EncuestaSQLUseCase {
    let goEncuestaEntityManager: EncuestaEntityManager!
    
    
    init() {
        self.goEncuestaEntityManager = EncuestaEntityManager()
    }

    func listarEncuestas() -> [HeaderModel]{
        return goEncuestaEntityManager.get()
    }
}
