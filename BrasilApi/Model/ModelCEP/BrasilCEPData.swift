//
//  BrasilCEPData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation


struct BrasilCEPData: Codable {
    var cep: String?
    var state: String?
    var city: String?
    var neighborhood: String?
    var street: String?
    var service: String?
    var location: Location?
}

struct Location: Codable {
    var type: String?
    var coordinates: Coordinates?
}

struct Coordinates: Codable {
    var longitude: String?
    var latitude: String?
}
