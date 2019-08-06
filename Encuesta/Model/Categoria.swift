//
//  Categoria.swift
//  Encuesta
//
//  Created by Paolo Eduardo Arámbulo Calderon on 8/1/19.
//  Copyright © 2019 Paolo Eduardo Arámbulo Calderon. All rights reserved.
//

import Foundation

struct Categoria: Decodable {
    let id: Int?
    let name: String?
    let image: String?
    let description:String?
    let order:Int?
    let status:Int?
}
