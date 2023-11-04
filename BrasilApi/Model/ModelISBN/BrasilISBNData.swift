//
//  BrasilISBNData.swift
//  BrasilApi
//
//  Created by Daniel Washington Ignacio on 03/11/23.
//

import Foundation

struct BrasilISBNData: Codable {
    var isbn: String?
    var title: String?
    var subtitle: String?
    var authors: [String]?
    var publisher: String?
    var synopsis: String?
    var dimensions: Dimensions?
    var year: Int?
    var format: String?
    var page_count: Int?
    var subjects: [String]?
    var location: String?
    var retail_price: String?
    var cover_url: String?
    var provider: String?
}

struct Dimensions: Codable {
    var width: Float?
    var height: Float?
    var unit: String?
}
