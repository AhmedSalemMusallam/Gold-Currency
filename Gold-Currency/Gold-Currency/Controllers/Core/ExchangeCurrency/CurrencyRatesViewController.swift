//
//  CurrencyRatesViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 13/01/2023.
//

import UIKit

class CurrencyRatesViewController: UIViewController {

    //Mark:- Variables
    private var currencyRates:[CurrencyRates]?
    override func viewDidLoad() {
        super.viewDidLoad()

        APICaller.shared.getCurrencyRates{[weak self] results in
            print(results)
//            switch results {
//            case .success(let currencyRates):
//                self?.currencyRates = currencyRates
//                DispatchQueue.main.async {
//                    print(currencyRates)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
