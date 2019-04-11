//
//  Vehiculo.swift
//  SegundaMano
//
//  Created by Dev2 on 11/04/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import Foundation

class Vehiculo: CustomStringConvertible {
    
    let maker: String
    let model: String
    let year: String
    let kilometros: Int

    var price : Double?

    init ( _ maker: String, _ model: String,_ year: String, _ kilometros: Int ) {
        self.maker = maker
        self.model = model
        self.year = year
        self.kilometros = kilometros

    }

    var description: String {
        return "del fabricante \(self.maker) modelo \(self.model) del año \(self.year)"
    }


}
