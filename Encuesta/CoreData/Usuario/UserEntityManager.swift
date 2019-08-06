//
//  UserEntityManager.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/2/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class UserEntityManager {
    
    init(){
        
    }
    
    public func get() -> Bool{
        var isSession: Bool = false
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let contexto = delegado.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        do{
            let datos = try contexto.fetch(request) as! [NSManagedObject]
            if datos.count != 0{
                isSession = true
            }else {
                 isSession = false
            }
        }catch{
            isSession = false
            print(error)
        }
        
        return isSession
    }
    
    public func delete() {
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let contexto = delegado.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        request.predicate = NSPredicate(format: "usuario = %@", "admin@mail.com")
        do{
            let test = try contexto.fetch(request)
            let objectToDelete = test[0] as! NSManagedObject
            contexto.delete(objectToDelete)
            do{
               try contexto.save()
            }catch {
                print(error)
            }
        }catch{
            print(error)
        }
    }
}
