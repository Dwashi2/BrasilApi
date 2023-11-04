//
//  BrasilRegistroBrData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilRegistroBrData: Codable {
    var status_code: Int?
    var status: String?
    var fqdn: String?
    var fqdnace: String?
    var exempt: Bool?
    var hosts: [String]?
    var publication_status: String?
    var expires_at: String?
    var suggestions: [String]?
}
