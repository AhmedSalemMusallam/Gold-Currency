//
//  ExchangeCurrency.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 13/01/2023.
//

import Foundation

struct ExchangeCurrency : Codable
{
    let base: String?
    let to: String?
    let amount: Double?
    let converted: Double?
    let rate: Double?
    let lastUpdate: Double?
}
