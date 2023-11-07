//
//  BrasilApiISBNManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilIsbnManagerDelegate {
    func checkIsbn(_ isbnManager: BrasilApiISBNManager, isbn: BrasilISBNData)
    func didFailWithError(error: Error)
}

struct BrasilApiISBNManager {
    let apiURL = Constants.url
    
    var delegate: BrasilIsbnManagerDelegate?
    
    func fetchInformacaoSobreOLivroAPartirDoISBN(isbn: Int) -> String {
        let urlString = "\(apiURL)\(Constants.isbn)\(isbn)"
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
                    if let brasilIsbnData = parseJSON(safeData) {
                        print("brasilIsbnData: \(brasilIsbnData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilIsbnData: Data) -> BrasilISBNData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilISBNData.self, from: brasilIsbnData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

