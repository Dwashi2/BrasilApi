//
//  BrasilApiDDDManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilDddManagerDelegate {
    func checkDdd(_ dddManager: BrasilApiDDDManager, ddd: BrasilDDDData)
    func didFailWithError(error: Error)
}

struct BrasilApiDDDManager {
    let apiURL = Constants.url
    
    var delegate: BrasilDddManagerDelegate?
    
    func fetchEstadoEListaDeCidadesPorDDD(DDD: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ddd)\(DDD)"
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
                    if let brasilDDDData = parseJSON(safeData) {
                        print("brasilDDDData: \(brasilDDDData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilDDDData: Data) -> BrasilDDDData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilDDDData.self, from: brasilDDDData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

