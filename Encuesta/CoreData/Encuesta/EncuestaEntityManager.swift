//
//  EncuestaEntityManager.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/4/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EncuestaEntityManager {
    
    init(){
        
    }
    
    public func get() -> [HeaderModel]{
        var datosList: [EncuestaModel] = []
        var datosHeaderList: [HeaderModel] = []
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let contexto = delegado.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Encuesta")
        do{
            let data = try contexto.fetch(request) as! [NSManagedObject]
            
            for a in data {
                datosList += [EncuestaModel(categoria: a.value(forKey: "categoria") as! Int, nombre: a.value(forKey: "nombre") as! String, apellido: a.value(forKey: "apellido") as! String, fecha_nacimiento: a.value(forKey: "fecha_nacimiento") as! String, correo: a.value(forKey: "correo") as! String, dni: a.value(forKey: "dni") as! String, porque: a.value(forKey: "porque") as! String)]
            }
            
            for cat in RealizarEncuestaViewController.gaoCategorias {
                var lista: [EncuestaModel] = []
                for a in datosList {
                    if a.categoria == cat.id{
                        lista += [a]
                    }
                }
                datosHeaderList += [HeaderModel(categoria: cat.id ?? -1, estado_botón: lista.count != 0 ? true : false,estado_celda: true, lista_encuesta: lista)]
            }
            
        }catch{
            print(error)
        }
        return datosHeaderList
    }
    
}
