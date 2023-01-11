//
//  ExchangeViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 09/01/2023.
//

import UIKit

class ExchangeViewController: UIViewController {

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
