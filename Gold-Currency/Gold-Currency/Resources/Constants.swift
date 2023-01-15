//
//  Constants.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 12/01/2023.
//

import Foundation

let metalTypesDictionary = ["XAU" : "XAU - Gold",
                              "XAG" : "XAG - Silver",
                              "XPT" : "XPT - Platinum",
                              "XPD" : "XPD - Palladium"];

let currencyDictionary = ["USD" : "USD - United States Dollar",
                            "AUD" : "AUD - Australian",
                            "GBP" : "GBP - British Pound",
                            "EUR" : "EUR - European Euro",
                            "CHF" : "CHF - Swiss Franc",
                            "CAD" : "CAD - Canadian Dollar",
                            "JPY" : "JPY - Japanses Yen",
                            "KRW" : "KRW - South Korean Won",
                            "INR" : "INR - Indian Rupee",
                            "CNY" : "CNY - Chinese - Yuan Renmibi",
                            "ZAR" : "ZAR - South African",
                            "THB" : "THB - Thai Baht",
                            "SGD" : "SGD - Singapore Dollar",
                            "BTC" : "BTC - Bitcoin",
                            "HKD" : "HKD - Hong Kong Dollar",
                            "CZK" : "CZK - Czech Krona",
                            "RUB" : "RUB - Russian Ruble",
                            "PLN" : "PLN - Polish Zloty",
                            "MYR" : "MYR - Malaysian Ringgit",
                            "AED" : "AED - U.A.E Dirham",
                            "KWD" : "KWD - Kuwaiti Dinar",
                            "EGP" : "EGP - Egyptian Pound",
                            "OMR" : "OMR - Omani Rial",
                            "SAR" : "SAR - Saudi Rial",
                            "MXN" : "MXN - Mexican Peso"];

let languages = [
    "EN":"English",
    "AR":"Arabic"
]

let ExchangeCurrencyDictionary = [
    "EUR" : "Euro",
    "USD" : "United States Dollar",
    "JPY" : "Japanese Yen",
    "BGN" : "Bulgarian Lev",
    "CZK" : "Czech Koruna",
    "DKK" : "Danish Krone",
    "GBP" : "Pound sterling",
    "HUF" : "Hungarian Forint",
    "PLN" : "Polish Zloty",
    "RON" : "Romanian Leu",
    "SEK" : "Swedish Krona",
    "CHF" : "Swiss Franc",
    "ISK" : "Icelandic Króna",
    "NOK" : "Norwegian Krone",
    "TRY" : "Turkish lira",
    "AUD" : "Australian Dollar",
    "BRL" : "Brazilian Real",
    "CAD" : "Canadian Dollar",
    "CNY" : "Chinese Yuan",
    "HKD" : "Hong Kong Dollar",
    "IDR" : "Indonesian Rupiah",
    "INR" : "Indian Rupee",
    "KRW" : "South Korean won",
    "MXN" : "Mexican Peso",
    "MYR" : "Malaysian Ringgit",
    "NZD" : "New Zealand Dollar",
    "PHP" : "Philippine peso",
    "SGD" : "Singapore Dollar",
    "THB" : "Thai Baht",
    "ZAR" : "South African Rand"
]


public func getDateFromTimeStamp(timeStamp : Double) -> String {

        let date = NSDate(timeIntervalSince1970: timeStamp / 1000)
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
     // UnComment below to get only time
    //  dayTimePeriodFormatter.dateFormat = "hh:mm a"

        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
