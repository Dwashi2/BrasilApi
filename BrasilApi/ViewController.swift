//
//  ViewController.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 01/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var brasilApiBankManager = BrasilApiBankManager()
    var brasilApiCepManager = BrasilApiCepManager()
    var brasilApiCnpjManager = BrasilApiCnpjManager()
    var brasilApiCorretoraManager = BrasilApiCorretoraManager()
    var brasilApiCptecManager = BrasilApiCptecData()
    var brasilApiDDDManager = BrasilApiDDDManager()
    var brasilApiIBGEManager = BrasilApiIBGEManager()
    var brasilApiNCMManager = BrasilApiNCMManager()
    var brasilApiRegistroBrManager = BrasilApiRegistroBrManager()
    var brasilApiTaxasManager = BrasilApiTaxasManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var test = brasilApiTaxasManager.fetchBuscasInformacoesDeUmaTaxaPorNomeOuSigla(sigla: "SELIC")
        brasilApiTaxasManager.performRequestSigla(with: test)
        
        
    }


}

