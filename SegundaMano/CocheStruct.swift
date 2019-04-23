//
//  CocheStruct.swift
//  SegundaMano
//
//  Created by Dev2 on 10/04/2019.
//  Copyright © 2019 CFTIC. All rights reserved.
//

import Foundation

struct Car: Codable {
    let id: String
    let maker: String
    let model: String
    let platter: String
    let year: String
    let price: Double

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case maker = "maker"
        case model = "model"
        case platter = "platter"
        case year = "year"
        case price = "price"

    }

    func toString() -> String {
        return "Modelo: \(self.model)"
    }
}


