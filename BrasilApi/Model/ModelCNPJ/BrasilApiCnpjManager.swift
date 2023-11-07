//
//  BrasilApiCnpjManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilCnpjManagerDelegate {
    func checkCnpj(_ cnpjManager: BrasilApiCnpjManager, cnpj: BrasilCNPJData)
    func didFailWithError(error: Error)
}

struct BrasilApiCnpjManager {
    let apiURL = Constants.url
    
    var delegate: BrasilCnpjManagerDelegate?
    
    func fetchCNPJ(CNJP: Int) -> String {
        let urlString = "\(apiURL)\(Constants.cnpj)\(CNJP)"
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
                    if let brasilCnpjData = parseJSON(safeData) {
                        print("brasilCnpjData: \(brasilCnpjData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilCnpjData: Data) -> BrasilCNPJData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilCNPJData.self, from: brasilCnpjData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

