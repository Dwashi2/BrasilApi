//
//  BrasilApiCorretoraManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilApiCorretoraManager {
    let apiURL = "https://brasilapi.com.br/api/"
    
    func fetchCorretoras() -> String {
        let urlString = "\(apiURL)cvm/corretoras/v1/"
        return urlString
    }
    
    func fetchCorretorasByCNPJ(CNPJ: Int) -> String {
        let urlString = "\(apiURL)cvm/corretoras/v1/\(CNPJ)"
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
                    if let brasilCorretoraData = parseJSON(safeData) {
                        print("brasilCorretoraData: \(brasilCorretoraData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilCorretoraData: Data) -> [BrasilCorretoraData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilCorretoraData].self, from: brasilCorretoraData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}
