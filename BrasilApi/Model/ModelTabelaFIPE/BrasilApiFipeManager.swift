//
//  BrasilApiFipeManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilFipeManagerDelegate {
    func checkFipe(_ fipeManager: BrasilApiFipeManager, fipe: [BrasilFIPEData])
    func didFailWithError(error: Error)
}

struct BrasilApiFipeManager {
    let apiURL = Constants.url
    
    var delegate: BrasilFipeManagerDelegate?
    
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
                    delegate?.didFailWithError(error: error!)
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
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

