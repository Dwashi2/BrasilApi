//
//  BrasilApiNCMManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilNcmManagerDelegate {
    func checkNcm(_ ncmManager: BrasilApiNCMManager, ncm: BrasilNCMData)
    func checkNcmArray(_ ncmManager: BrasilApiNCMManager, ncm: [BrasilNCMData])
    func didFailWithError(error: Error)
}

struct BrasilApiNCMManager {
    let apiURL = Constants.url
    
    var delegate: BrasilNcmManagerDelegate?
    
    func fetchInformacaoDeTodosOsNCM() -> String {
        let urlString = "\(apiURL)\(Constants.ncm)"
        return urlString
    }
    
    func fetchIPesquisaPorNCM(code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ncm)?search=\(code)"
        return urlString
    }
    
    func fetchIBuscaNCMPorCodigo(code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ncm)/\(code)"
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
                    if let brasilNCMData = parseJSON(safeData) {
                        print("brasilNCMData: \(brasilNCMData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilNCMData: Data) -> [BrasilNCMData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilNCMData].self, from: brasilNCMData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func performRequestCode(with urlString: String) {
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
                    if let brasilNCMData = parseJSONCode(safeData) {
                        print("brasilNCMData: \(brasilNCMData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSONCode(_ brasilNCMData: Data) -> BrasilNCMData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilNCMData.self, from: brasilNCMData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

