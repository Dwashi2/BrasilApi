//
//  BrasilApiCepManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilApiCepManager {
    let apiURL = "https://brasilapi.com.br/api/"
    
    func fetchCEP(CEP: Int) -> String {
        let urlString = "\(apiURL)cep/v1/\(CEP)"
        return urlString
    }
    
    func fetchCEPV2(CEP: Int) -> String {
        let urlString = "\(apiURL)cep/v2/\(CEP)"
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
                    if let brasilCepData = parseJSON(safeData) {
                        print("brasilCepData: \(brasilCepData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilCepData: Data) -> BrasilCEPData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilCEPData.self, from: brasilCepData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}
