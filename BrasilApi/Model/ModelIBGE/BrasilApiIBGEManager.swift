//
//  BrasilApiIBGEManager.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

protocol BrasilIbgeManagerDelegate {
    func checkIbge(_ ibgeManager: BrasilApiIBGEManager, ibge: BrasilIBGEData)
    func checkIbgeArray(_ ibgeManager: BrasilApiIBGEManager, ibge: [BrasilIBGEData])
    func didFailWithError(error: Error)
}

struct BrasilApiIBGEManager {
    let apiURL = Constants.url
    
    var delegate: BrasilIbgeManagerDelegate?
    
    func fetchMunicipios(Sigla: String) -> String {
        let urlString = "\(apiURL)\(Constants.ibgeMunicipios)\(Sigla)?providers=dados-abertos-br,gov,wikipedia"
        return urlString
    }
    
    func fetchRetornaTodosOsEstados() -> String {
        let urlString = "\(apiURL)\(Constants.ibgeEstados)"
        return urlString
    }
    
    func fetchInformacaoDeUmEstadoPorSigaOuCodigo(Code: Int) -> String {
        let urlString = "\(apiURL)\(Constants.ibgeEstados)\(Code)"
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
                    if let brasilIbgeData = parseJSON(safeData) {
                        print("brasilIbgeData: \(brasilIbgeData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    func parseJSON(_ brasilIbgeData: Data) -> [BrasilIBGEData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BrasilIBGEData].self, from: brasilIbgeData)
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
                    if let brasilIbgeData = parseJSONCode(safeData) {
                        print("brasilIbgeData: \(brasilIbgeData)")
                    }
                }
            }
            //MARK: - 4. START THE TASK
            task.resume()
        }
    }
    
    
    //MARK: - fetchInformacaoDeUmEstadoPorSigaOuCodigo
    
    func parseJSONCode(_ brasilIbgeData: Data) -> BrasilIBGEData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BrasilIBGEData.self, from: brasilIbgeData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

