//
//  APICaller.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 23/12/2022.
//

import Foundation

struct Constants{
    //Gold API
    static let API_KEY = "goldapi-13wxdztlbf34ozi-io"
    static let baseURL = "https://www.goldapi.io/api"
    static var metalKey = ""
    static var currencyKey = ""
    
    //Currency Exchange API
    static let currencyAPI_KEY = "od41osnug08ahufgegp8nen9e7hecj869n9g3qvvgnebdq7tek18"
    
    //currency Rates
    static let currencyRatesbaseURL = "https://anyapi.io/api/v1/exchange/rates?"
    static var baseCurrency = ""
    
    //Exchange Currency
    static let exchangeCurrencybaseURL = "https://anyapi.io/api/v1/exchange/convert?"
    static var exBaseCurrency = "USD"
    static var toCurrency = "EUR"
    static var amountCurrency = "100"
}


enum APIError: Error
{
    case failedToGetData
}


class APICaller
{
    static let shared = APICaller()
    
    //Mark:- Exchange Currency
    func getExchangeCurrency(completion: @escaping (Result<[ExchangeCurrency],Error>) -> Void)
    {
        guard let url = URL(string: "\(Constants.exchangeCurrencybaseURL)apiKey=\(Constants.currencyAPI_KEY)&base=\(Constants.exBaseCurrency)&to=\(Constants.toCurrency)&amount=\(Constants.amountCurrency)") else { return }
        
        print(url)
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){
            data, _ , error in
            
            guard let data = data , error  == nil else{
                return
            }
            
            do{

                let results =  try JSONDecoder().decode(ExchangeCurrency.self, from: data)
                completion(.success([results]))

            }catch{
                completion(.failure(APIError.failedToGetData))

            }
            
            
        }
        
        task.resume()
        
        
    }
    //Mark:- getting Currency Rates
    func getCurrencyRates(completion: @escaping (Result<[CurrencyRates],Error>) -> Void)
    {
        guard let url = URL(string: "\(Constants.currencyRatesbaseURL)apiKey=\(Constants.currencyAPI_KEY)&base=\(Constants.baseCurrency)") else { return }
        
        print(url)
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){
            data, _ , error in
            
            guard let data = data , error  == nil else{
                return
            }
            
            do{
//                    let results =  try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results =  try JSONDecoder().decode(CurrencyRates.self, from: data)
                completion(.success([results]))
               
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
            
        }
        
        task.resume()
        
        
    }
    //Mark:- Get Gold Prices
    func getPrices(completion: @escaping (Result<[Metal],Error>) -> Void)
        {
            guard let url = URL(string: "\(Constants.baseURL)/\(Constants.metalKey)/\(Constants.currencyKey)") else { return }
            
            print(url)
            var request = URLRequest(url: url)
            request.setValue("goldapi-13wxdztlbf34ozi-io", forHTTPHeaderField: "x-access-token")
            let task = URLSession.shared.dataTask(with: request){
                data, _ , error in
                
                guard let data = data , error  == nil else{
                    return
                }
                
                do{
//                    let results =  try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    let results =  try JSONDecoder().decode(Metal.self, from: data)
                    completion(.success([results]))
//                    print(results)
                }catch{
                    completion(.failure(APIError.failedToGetData))
//                    print(error.localizedDescription)
//                    print("Error")
                }
                
                
            }
            
            task.resume()
            
        }
}


