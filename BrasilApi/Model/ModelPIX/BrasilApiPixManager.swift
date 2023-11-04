//
//  BrasilApiPixManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilApiPixManager {
    let apiURL = "https://brasilapi.com.br/api/"

    func fetchRetornaTodosOsParticipantesDoPIXNoDiaAtualOuAnterior() -> String {
        let urlString = "\(apiURL)pix/v1/participants"
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
                    if let brasilPixData = parseJSON(safeData) {
                        print("brasilPixData: \(brasilPixData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilPixData: Data) -> [BrasilPIXData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilPIXData].self, from: brasilPixData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}


