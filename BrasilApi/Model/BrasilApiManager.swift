//
//  BrasilApiManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 01/11/23.
//

import Foundation

struct BrasilApiManager {
    let apiURL = Constants.url
    
    func fetchBank(bank: String) -> String {
        let urlString = "\(apiURL)\(Constants.banks)"
        return urlString
    }
    
    func fetchbankByCode(code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.banks)\(code)"
        return urlString
    }
    
    func fetchCEP(CEP: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cep)/v1/\(CEP)"
        return urlString
    }
    
    func fetchCEPV2(CEP: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cep)/v2/\(CEP)"
        return urlString
    }
    
    func fetchCNPJ(CNJP: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cnpj)\(CNJP)"
        return urlString
    }
    
    func fetchCorretoras() -> String {
        let urlString = "\(apiURL)\(Constants.corretoras)"
        return urlString
    }
    
    func fetchCorretorasByCNPJ(CNPJ: Int) -> String {
        let urlString = "\(apiURL)\(Constants.corretoras)\(CNPJ)"
        return urlString
    }
    
    func fetchCptecListarLocalidades() -> String {
        let urlString = "\(apiURL)\(Constants.cptecCidade)"
        return urlString
    }
    
    func fetchCptecBuscarLocalidadesCityName(CityName: String) -> String {
        let urlString = "\(apiURL)\(Constants.cptecCidade)\(CityName)"
        return urlString
    }
    
    func fetchCptecCondicoesAtuaisNasCapitais() -> String {
        let urlString = "\(apiURL)\(Constants.cptecClima)capital"
        return urlString
    }
    
    func fetchCptecCondicoesAtuaisNosAeroportos(CodigoICAO: String) -> String {
        let urlString = "\(apiURL)\(Constants.cptecClima)aeroporto/\(CodigoICAO)"
        return urlString
    }
    
    func fetchCptecPrevisaoMeteologicaParaUmaCidade(CityCode: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cptecClima)previsao/\(CityCode)"
        return urlString
    }
    
    func fetchCptecPrevisaoMeteologicaParaAteSeisDias(CityCode: Int, Days: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cptecClima)previsao/\(CityCode)/\(Days)"
        return urlString
    }

    func fetchCptecPrevisaoOceanica(CityCode: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cptecOndas)\(CityCode)"
        return urlString
    }
    
    func fetchCptecPrevisaoOceanicaParaAteSeisDias(CityCode: Int, Days: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cptecOndas)\(CityCode)/\(Days)"
        return urlString
    }
    
    func fetchEstadoEListaDeCidadesPorDDD(DDD: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ddd)\(DDD)"
        return urlString
    }
    
    func fetchFeriadosNacionais(Ano: Int) -> String {
        let urlString = "\(apiURL)\(Constants.feriados)\(Ano)"
        return urlString
    }
    
    func fetchListarMarcasDeVeiculosReferenteAoTipo(TipoVeiculo: String) -> String {
        let urlString = "\(apiURL)\(Constants.fipeMarcas)\(TipoVeiculo)"
        return urlString
    }
    
    func fetchConstultaPreco(CodigoFipe: Int) -> String {
        let urlString = "\(apiURL)\(Constants.fipePreco)\(CodigoFipe)"
        return urlString
    }
    
    func fetchListaTabelasDeReferenciaExistentes() -> String {
        let urlString = "\(apiURL)\(Constants.fipeTabelas)"
        return urlString
    }
    
    func fetchMunicipios(Sigla: String) -> String {
        let urlString = "\(apiURL)\(Constants.ibgeMunicipios)\(Sigla)?providers=dados-abertos-br,gov,wikipedia"
        return urlString
    }
    
    func fetchRetornaTodosOsEstados() -> String {
        let urlString = "\(apiURL)\(Constants.ibgeEstados)"
        return urlString
    }
    
    func fetchInformacaoDeUmEstadoPorSigaOuCodigo(Code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ibgeEstados)\(Code)"
        return urlString
    }
    
    func fetchInformacaoSobreOLivroAPartirDoISBN(isbn: Int) -> String {
        let urlString = "\(apiURL)\(Constants.isbn)\(isbn)"
        return urlString
    }
    
    func fetchInformacaoDeTodosOsNCM() -> String {
        let urlString = "\(apiURL)\(Constants.ncm)"
        return urlString
    }
    
    func fetchIPesquisaPorNCM(code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ncm)?search=\(code)"
        return urlString
    }
    
    func fetchIBuscaNCMPorCodigo(code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ncm)/\(code)"
        return urlString
    }

    func fetchRetornaTodosOsParticipantesDoPIXNoDiaAtualOuAnterior() -> String {
        let urlString = "\(apiURL)\(Constants.pix)"
        return urlString
    }
    
    func fetchAvaliaOStatusDeUmDominioBR(domain: String) -> String {
        let urlString = "\(apiURL)\(Constants.registroBr)\(domain)"
        return urlString
    }
    
    func fetchRetornaAsTaxasDeJurosEIndicesOficiais() -> String {
        let urlString = "\(apiURL)\(Constants.taxas)"
        return urlString
    }
    
    func fetchBuscasInformacoesDeUmaTaxaPorNomeOuSigla(sigla: String) -> String {
        let urlString = "\(apiURL)\(Constants.taxas)\(sigla)"
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

