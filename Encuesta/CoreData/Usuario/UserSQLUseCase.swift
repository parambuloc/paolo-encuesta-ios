//
//  UserSQLUseCase.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/2/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation

class UserSQLUseCase {
    let goUserEntityManager: UserEntityManager!
    

    init() {
        self.goUserEntityManager = UserEntityManager()
    }
    
    func deleteUser() {
        goUserEntityManager.delete()
    }
    
    func existSession() -> Bool {
        return goUserEntityManager.get()
    }
    
}
