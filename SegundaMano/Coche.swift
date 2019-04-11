//
//  Coche.swift
//  SegundaMano
//
//  Created by Dev2 on 09/04/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import Foundation

class Coche {

    var maker: String
    var model: String
    var platter: String
    var year: String
    var price: Double?

    convenience init (_ maker: String, _ model: String, _ platter: String) {


        self.init(maker,model,platter, "YYYY", 2000);


    }
   

    init ( _ maker: String, _ model: String,_ platter: String, _ year: String, _ price:Double? ) {
        self.maker = maker
        self.model = model
        self.platter = platter
        self.year = year
        self.price = price

    }


    func toString() ->  String {
        return "Soy un \(self.maker)"
    }

    func toJson() -> Data? {
        let json: [String: Any]  = [
            "maker":self.maker,
            "model": self.model,
            "platter":self.platter,
            "year":self.year,
            "price":self.price ?? 0
        ]

        return try? JSONSerialization.data(withJSONObject: json)
    }


}

