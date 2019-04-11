//
//  Coche.swift
//  SegundaMano
//
//  Created by Dev2 on 09/04/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import Foundation

class Coche : Vehiculo {

    var platter: String?
    let puertas: Int



    init ( _ puertas: Int, _ maker: String, _ model: String,_ year: String, _ kilometros: Int) {

        self.puertas = puertas
        self.platter = platter ?? ""
        super.init(maker, model , year, kilometros)
    }


    override var description: String {
        return "Vehiculo " + super.description + ". La matricula es \(String(self.platter!)) y tiene \(String(self.puertas)) puertas."
    }

    func toJson() -> Data? {
        let json: [String: Any]  = [
            "maker":self.maker,
            "model": self.model,
            "platter": self.platter!,
            "year":self.year,
            "price":self.price ?? 0
        ]

        return try? JSONSerialization.data(withJSONObject: json)
    }


}

