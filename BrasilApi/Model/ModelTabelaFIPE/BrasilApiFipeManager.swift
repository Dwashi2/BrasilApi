//
//  BrasilApiFipeManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilApiFipeManager {
    let apiURL = "https://brasilapi.com.br/api/"
    
    func fetchListarMarcasDeVeiculosReferenteAoTipo(TipoVeiculo: String) -> String {
        let urlString = "\(apiURL)fipe/marcas/v1/\(TipoVeiculo)"
        return urlString
    }
    
    func fetchConstultaPreco(CodigoFipe: String) -> String {
        let urlString = "\(apiURL)fipe/preco/v1/\(CodigoFipe)"
        return urlString
    }
    
    func fetchListaTabelasDeReferenciaExistentes() -> String {
        let urlString = "\(apiURL)fipe/tabelas/v1"
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
                    if let brasilFipeData = parseJSON(safeData) {
                        print("brasilFipeData: \(brasilFipeData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilFipeData: Data) -> [BrasilFIPEData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilFIPEData].self, from: brasilFipeData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}

