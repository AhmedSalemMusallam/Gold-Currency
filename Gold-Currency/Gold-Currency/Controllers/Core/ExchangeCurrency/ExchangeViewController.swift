//
//  ExchangeViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 09/01/2023.
//

import UIKit

class ExchangeViewController: UIViewController {

    //Mark:- Outlets
    
    @IBOutlet weak var currencyRatesView: UIView!
    
    @IBOutlet weak var currencyExchangeView: UIView!
    
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    
    //Mark:- Currency Exchange Rate
    @IBAction func currencySegmentedControlAction(_ sender: Any) {
        switch currencySegmentedControl.selectedSegmentIndex
        {
        case 0:
            currencyRatesView.alpha = 0
            currencyExchangeView.alpha = 1
        case 1:
            currencyRatesView.alpha = 1
            currencyExchangeView.alpha = 0
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Mark:- Setting Application Mode
        if SceneDelegate.userData.bool(forKey: "LightMode")
        {
            view.overrideUserInterfaceStyle = .light
        }else{
            view.overrideUserInterfaceStyle = .dark
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //Mark:- Styling Segmented Control
        currencySegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name:"Roboto Slab Bold", size: 14) as Any], for: .normal)
                                                         
        //Mark:- Segmented Control Default Screen
        currencyRatesView.alpha = 0
        currencyExchangeView.alpha = 1
        
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
