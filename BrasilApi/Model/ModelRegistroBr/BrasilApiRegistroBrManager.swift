//
//  BrasilApiRegistroBrManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilApiRegistroBrManager {
    let apiURL = "https://brasilapi.com.br/api/"
    
    func fetchAvaliaOStatusDeUmDominioBR(domain: String) -> String {
        let urlString = "\(apiURL)registrobr/v1/\(domain)"
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
                    if let brasilRegistroBrData = parseJSON(safeData) {
                        print("brasilRegistroBrData: \(brasilRegistroBrData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilRegistroBrData: Data) -> BrasilRegistroBrData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilRegistroBrData.self, from: brasilRegistroBrData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}

