//
//  Metal.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 23/12/2022.
//

import Foundation


struct Metal : Codable{
    let timestamp: Int
    let metal: String?
    let currency: String?
    let exchange: String?
    let symbol: String?
    let open_time: Int?
    let ask: Double?
    let bid: Double?
    let price: Double?
    let ch: Double?
    let price_gram_24k: Double?
    let price_gram_22k: Double?
    let price_gram_20k: Double?
    let price_gram_18k: Double?
}

