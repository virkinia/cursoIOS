//
//  Camion.swift
//  SegundaMano
//
//  Created by Dev2 on 11/04/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import Foundation

class Camion: Vehiculo {

    let tara: Int
    let espacio: Double

    init(_ tara: Int,
         _ espacio: Double,
         vehiculo: Vehiculo) {
        self.tara = tara
        self.espacio = espacio

        super.init(vehiculo.maker, vehiculo.model, vehiculo.year, vehiculo.kilometros)
    }

    override var description: String {
        return "El camion tiene \(super.description). Con espacio de \(self.espacio) y una tara máxima de \(self.tara)"
    }
    
}
