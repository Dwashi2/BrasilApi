//
//  BrasilApiCptecData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilApiCptecData {
    let apiURL = "https://brasilapi.com.br/api/"
    
    func fetchCptecListarLocalidades() -> String {
        let urlString = "\(apiURL)cptec/v1/cidade"
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
                    if let brasilCptecData = parseJSON(safeData) {
                        print("brasilCptecData: \(brasilCptecData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    func parseJSON(_ brasilCptecData: Data) -> [BrasilCptecData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilCptecData].self, from: brasilCptecData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
    
    //MARK: - performRequestWithoutArray will be use with fetchCptecCondicoesAtuaisNosAeroportos,fetchCptecPrevisaoMeteologicaParaUmaCidade, fetchCptecPrevisaoMeteologicaParaAteSeisDias, fetchCptecPrevisaoOceanica, fetchCptecPrevisaoOceanicaParaAteSeisDias
    func performRequestWithoutArray(with urlString: String) {
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
                    if let brasilCptecData = parseJSONWithoutArray(safeData) {
                        print("brasilCptecData: \(brasilCptecData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    func parseJSONWithoutArray(_ brasilCptecData: Data) -> BrasilCptecData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilCptecData.self, from: brasilCptecData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    

    
}

