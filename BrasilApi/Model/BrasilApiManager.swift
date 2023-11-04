//
//  BrasilApiManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 01/11/23.
//

import Foundation

struct BrasilApiManager {
    let apiURL = "https://brasilapi.com.br/api/"
    
    func fetchBank(bank: String) -> String {
        let urlString = "\(apiURL)banks/v1"
        return urlString
    }
    
    func fetchbankByCode(code: Int) -> String {
        let urlString = "\(apiURL)banks/v1/\(code)"
        return urlString
    }
    
    func fetchCEP(CEP: Int) -> String {
        let urlString = "\(apiURL)cep/v1/\(CEP)"
        return urlString
    }
    
    func fetchCEPV2(CEP: Int) -> String {
        let urlString = "\(apiURL)cep/v2/\(CEP)"
        return urlString
    }
    
    func fetchCNPJ(CNJP: Int) -> String {
        let urlString = "\(apiURL)cnpj/v1/\(CNJP)"
        return urlString
    }
    
    func fetchCorretoras() -> String {
        let urlString = "\(apiURL)cvm/corretoras/v1/"
        return urlString
    }
    
    func fetchCorretorasByCNPJ(CNPJ: Int) -> String {
        let urlString = "\(apiURL)cvm/corretoras/v1/\(CNPJ)"
        return urlString
    }
    
    func fetchCptecListarLocalidades() -> String {
        let urlString = "\(apiURL)cptecv1/cidade"
        return urlString
    }
    
    func fetchCptecBuscarLocalidadesCityName(CityName: String) -> String {
        let urlString = "\(apiURL)cptec/v1/cidade/\(CityName)"
        return urlString
    }
    
    func fetchCptecCondicoesAtuaisNasCapitais() -> String {
        let urlString = "\(apiURL)cptec/v1/clima/capital"
        return urlString
    }
    
    func fetchCptecCondicoesAtuaisNosAeroportos(CodigoICAO: String) -> String {
        let urlString = "\(apiURL)cptec/v1/clima/aeroporto/\(CodigoICAO)"
        return urlString
    }
    
    func fetchCptecPrevisaoMeteologicaParaUmaCidade(CityCode: Int) -> String {
        let urlString = "\(apiURL)cptec/v1/clima/previsao/\(CityCode)"
        return urlString
    }
    
    func fetchCptecPrevisaoMeteologicaParaAteSeisDias(CityCode: Int, Days: Int) -> String {
        let urlString = "\(apiURL)cptec/v1/clima/previsao/\(CityCode)/\(Days)"
        return urlString
    }

    func fetchCptecPrevisaoOceanica(CityCode: Int) -> String {
        let urlString = "\(apiURL)cptec/v1/ondas/\(CityCode)"
        return urlString
    }
    
    func fetchCptecPrevisaoOceanicaParaAteSeisDias(CityCode: Int, Days: Int) -> String {
        let urlString = "\(apiURL)cptec/v1/ondas/\(CityCode)/\(Days)"
        return urlString
    }
    
    func fetchEstadoEListaDeCidadesPorDDD(DDD: Int) -> String {
        let urlString = "\(apiURL)ddd/v1/\(DDD)"
        return urlString
    }
    
    func fetchFeriadosNacionais(Ano: Int) -> String {
        let urlString = "\(apiURL)feriados/v1/\(Ano)"
        return urlString
    }
    
    func fetchListarMarcasDeVeiculosReferenteAoTipo(TipoVeiculo: String) -> String {
        let urlString = "\(apiURL)fipe/marcas/v1/\(TipoVeiculo)"
        return urlString
    }
    
    func fetchConstultaPreco(CodigoFipe: Int) -> String {
        let urlString = "\(apiURL)fipe/preco/v1/\(CodigoFipe)"
        return urlString
    }
    
    func fetchListaTabelasDeReferenciaExistentes() -> String {
        let urlString = "\(apiURL)fipe/tabelas/v1"
        return urlString
    }
    
    func fetchMunicipios(Sigla: String) -> String {
        let urlString = "\(apiURL)ibge/municipios/v1/\(Sigla)?providers=dados-abertos-br,gov,wikipedia"
        return urlString
    }
    
    func fetchRetornaTodosOsEstados() -> String {
        let urlString = "\(apiURL)ibge/uf/v1"
        return urlString
    }
    
    func fetchInformacaoDeUmEstadoPorSigaOuCodigo(Code: Int) -> String {
        let urlString = "\(apiURL)ibge/uf/v1/\(Code)"
        return urlString
    }
    
    func fetchInformacaoSobreOLivroAPartirDoISBN(isbn: Int) -> String {
        let urlString = "\(apiURL)isbn/v1/\(isbn)"
        return urlString
    }
    
    func fetchInformacaoDeTodosOsNCM() -> String {
        let urlString = "\(apiURL)ncm/v1"
        return urlString
    }
    
    func fetchIPesquisaPorNCM(code: Int) -> String {
        let urlString = "\(apiURL)ncm/v1?search=\(code)"
        return urlString
    }
    
    func fetchIBuscaNCMPorCodigo(code: Int) -> String {
        let urlString = "\(apiURL)ncm/v1/\(code)"
        return urlString
    }

    func fetchRetornaTodosOsParticipantesDoPIXNoDiaAtualOuAnterior() -> String {
        let urlString = "\(apiURL)pix/v1/participantes"
        return urlString
    }
    
    func fetchAvaliaOStatusDeUmDominioBR(domain: String) -> String {
        let urlString = "\(apiURL)registrobr/v1/\(domain)"
        return urlString
    }
    
    func fetchRetornaAsTaxasDeJurosEIndicesOficiais() -> String {
        let urlString = "\(apiURL)taxas/v1"
        return urlString
    }
    
    func fetchBuscasInformacoesDeUmaTaxaPorNomeOuSigla(sigla: String) -> String {
        let urlString = "\(apiURL)taxas/v1/\(sigla)"
        return urlString
    }

    func performRequest(with urlString: String) {
        //MARK: - 1. CREATE A URL
        if let url = URL(string: urlString) {
            print("URL :\(url)")
            
            //MARK: - 2. CREATE A URLSESSION
            let session = URLSession(configuration: .default)
            print("Session: \(session)")
            
            //MARK: - 3. GIVE THE SESSION TASK
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                if let safeData = data {
                    print("safeData: \(safeData)")
                    if let brasilBankData = parseJSON(safeData) {
                        print("brasilBankData: \(brasilBankData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilBankData: Data) -> [BrasilBankData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilBankData].self, from: brasilBankData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}

