//
//  BrasilApiFeriadosManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilApiFeriadosManager {
    let apiURL = "https://brasilapi.com.br/api/"
    
    func fetchFeriadosNacionais(Ano: Int) -> String {
        let urlString = "\(apiURL)feriados/v1/\(Ano)"
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
                    if let brasilFeriadoData = parseJSON(safeData) {
                        print("brasilFeriadoData: \(brasilFeriadoData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilFeriadoData: Data) -> [BrasilFeriadosData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilFeriadosData].self, from: brasilFeriadoData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}

