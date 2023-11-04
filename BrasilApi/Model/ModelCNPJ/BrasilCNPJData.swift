//
//  BrasilCNPJData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilCNPJData: Codable {
    var cnpj: String?
    var identificador_matriz_filial: Int?
    var descricao_matriz_filial: String?
    var razao_social: String?
    var nome_fantasia: String?
    var situacao_cadastral: Int?
    var descricao_situacao_cadastral: String?
    var data_situacao_cadastral: String?
    var motivo_situacao_cadastral: Int?
    var nome_cidade_exterior: String?
    var codigo_natureza_juridica: Int?
    var data_inicio_atividade: String?
    var cnae_fiscal: Int?
    var cnae_fiscal_descricao: String?
    var descricao_tipo_logradouro: String?
    var logradouro: String?
    var numero: String?
    var complemento: String?
    var bairro: String?
    var cep: String?
    var uf: String?
    var codigo_municipio: Int?
    var municipio: String?
    var ddd_telefone_1: String?
    var ddd_telefone_2: String?
    var ddd_fax: String?
    var qualificacao_do_responsavel: Int?
    var capital_social: Int?
    var porte: String?
    var descricao_porte: String?
    var opcao_pelo_simples: Bool?
    var data_opcao_pelo_simples: String?
    var data_exclusao_do_simples: String?
    var opcao_pelo_mei: Bool?
    var situacao_especial: String?
    var data_situacao_especial: String?
    var cnaes_secundarios: [CnaesSecundarios]?
    var qsa: [Qsa]?
}

struct CnaesSecundarios: Codable {
    var codigo: Int?
    var descricao: String?
}

struct Qsa: Codable {
    var identificador_de_socio: Int?
    var nome_socio: String?
    var cnpj_cpf_do_socio: String?
    var codigo_qualificacao_socio: Int?
    var percentual_capital_social: Int?
    var data_entrada_sociedade: String?
    var cpf_representante_legal: String?
    var nome_representante_legal: String?
    var codigo_qualificacao_representante_legal: Int?
}
