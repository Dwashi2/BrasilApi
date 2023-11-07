//
//  BrasilApiTaxasManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilTaxasManagerDelegate {
    func checkTaxas(_ taxasManager: BrasilApiTaxasManager, taxas: [BrasilTaxasData])
    func checkTaxas(_ taxasManager: BrasilApiTaxasManager, taxas: BrasilTaxasData )
    func didFailWithError(error: Error)
}

struct BrasilApiTaxasManager {
    let apiURL = Constants.url
    
    var delegate: BrasilTaxasManagerDelegate?
    
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
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    print("safeData: \(safeData)")
                    if let brasilTaxasData = parseJSON(safeData) {
                        print("brasilTaxasData: \(brasilTaxasData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilTaxasData: Data) -> [BrasilTaxasData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilTaxasData].self, from: brasilTaxasData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
    //MARK: - fetchBuscasInformacoesDeUmaTaxaPorNomeOuSigla
    
    func performRequestSigla(with urlString: String) {
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
                    if let brasilTaxasData = parseJSONSigla(safeData) {
                        print("brasilTaxasData: \(brasilTaxasData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSONSigla(_ brasilTaxasData: Data) -> BrasilTaxasData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilTaxasData.self, from: brasilTaxasData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}

