//
//  CurrencyRates.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 13/01/2023.
//

import Foundation

struct Rates : Codable{
    let EUR: Double?
    let USD: Double?
    let JPY: Double?
    let BGN: Double?
    let CZK: Double?
    let DKK: Double?
    let GBP: Double?
    let HUF: Double?
    let PLN: Double?
    let RON: Double?
    let SEK: Double?
    let CHF: Double?
    let ISK: Double?
    let NOK: Double?
    let TRY: Double?
    let AUD: Double?
    let BRL: Double?
    let CAD: Double?
    let CNY: Double?
    let HKD: Double?
    let IDR: Double?
    let ILS: Double?
    let INR: Double?
    let KRW: Double?
    let MXN: Double?
    let MYR: Double?
    let NZD: Double?
    let PHP: Double?
    let SGD: Double?
    let THB: Double?
    let ZAR: Double?
    
}


struct CurrencyRates : Codable{
    let lastUpdate: Double?
    let base: String?
    let rates: Rates
    
}

