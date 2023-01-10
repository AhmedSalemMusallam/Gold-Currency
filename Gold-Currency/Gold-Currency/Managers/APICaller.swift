//
//  APICaller.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 23/12/2022.
//

import Foundation

struct Constants{
    static let API_KEY = "goldapi-13wxdztlbf34ozi-io"
    static let baseURL = "https://www.goldapi.io/api"
    static var metalKey = ""
    static var currencyKey = ""
}


enum APIError: Error
{
    case failedToGetData
}

class APICaller
{
    static let shared = APICaller()
    
    
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
                    print(results)
                }catch{
                    completion(.failure(APIError.failedToGetData))
//                    print(error.localizedDescription)
//                    print("Error")
                }
                
                
            }
            
            task.resume()
            
            
            
            
        }
}


