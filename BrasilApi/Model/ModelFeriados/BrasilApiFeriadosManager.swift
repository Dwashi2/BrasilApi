//
//  BrasilApiFeriadosManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilFeriadosManagerDelegate {
    func checkFeriados(_ feriadosManager: BrasilApiFeriadosManager, feriados: [BrasilFeriadosData])
    func didFailWithError(error: Error)
}

struct BrasilApiFeriadosManager {
    let apiURL = Constants.url
    
    var delegate: BrasilFeriadosManagerDelegate?
    
    func fetchFeriadosNacionais(Ano: Int) -> String {
        let urlString = "\(apiURL)\(Constants.feriados)\(Ano)"
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
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

