//
//  BrasilIBGEData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilIBGEData: Codable {
    var nome: String?
    var codigo_ibge: String?
    var id: Int?
    var sigla: String?
    var regiao: Regiao?
}

struct Regiao: Codable {
    var id: Int?
    var sigla: String?
    var nome: String?
}
