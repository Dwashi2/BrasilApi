//
//  BrasilCptecData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilCptecData: Codable {
    var nome: String?
    var estado: String?
    var id: Int?
    var codigo_icao: String?
    var atualizado_em: String?
    var pressao_atmosferica: Int?
    var visibilidade: String?
    var vento: Int?
    var direcao_vento: Int?
    var umidade: Int?
    var condicao: String?
    var condicao_Desc: String?
    var temp: Int?
    var cidade: String?
    var clima: [Clima]?
    var ondas: [Ondas]?
}

struct Clima: Codable {
    var data: String?
    var condicao: String?
    var min: Int?
    var max: Int?
    var indice_uv: Int?
    var condicao_desc: String?
}

struct Ondas: Codable {
    var data: String?
    var dados_ondas: [DadosOndas]?
}

struct DadosOndas: Codable {
    var vento: Float?
    var direcao_vento: String?
    var direcao_vento_desc: String?
    var altura_onda: Float?
    var direcao_onda: String?
    var direcao_onda_desc: String?
    var agitacao: String?
    var hora: String?
}
