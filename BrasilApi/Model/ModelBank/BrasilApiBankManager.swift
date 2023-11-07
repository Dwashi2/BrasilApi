//
//  BrasilApiBankManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilBankManagerDelegate {
    func checkBranks(_ bankManager: BrasilApiBankManager, bank: [BrasilBankData])
    func didFailWithError(error: Error)
}

struct BrasilApiBankManager {
    let apiURL = Constants.url
    
    var delegate: BrasilBankManagerDelegate?
    
    func fetchBank(bank: String) -> String {
        let urlString = "\(apiURL)\(Constants.banks)"
        return urlString
    }
    
    func fetchbankByCode(code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.banks)\(code)"
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
                    if let brasilBankData = parseJSON(safeData) {
                        print("brasilBankData: \(brasilBankData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilBankData: Data) -> [BrasilBankData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilBankData].self, from: brasilBankData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

