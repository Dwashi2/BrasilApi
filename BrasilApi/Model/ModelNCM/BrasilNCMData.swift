//
//  BrasilNCMData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilNCMData: Codable {
    var codigo: String?
    var descricao: String?
    var data_inicio: String?
    var data_fim: String?
    var tipo_ato: String?
    var numero_ato: String?
    var ano_ato: String?
}
