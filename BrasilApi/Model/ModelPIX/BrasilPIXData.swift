//
//  BrasilPIXData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilPIXData: Codable {
    var ispb: String?
    var nome: String?
    var nome_reduzido: String?
    var modalidade_participacao: String?
    var tipo_participacao: String?
    var inicio_operacao: String?
}
