//
//  SplashViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 09/01/2023.
//

import UIKit

class SplashViewController: UIViewController {
    
        
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var appName: UILabel!
    
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

       
        // Fire Segue to OnBoarding Screen
        PerformsSplashSegue()
        //Aniamte Logo and App Name
        animateLogoAndAppName()
        
        
    }
    
    //Mark:- functions
    private func PerformsSplashSegue()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.performSegue(withIdentifier: "PerformsSplashSegue", sender: nil)
//            print("Timer fired!")
        }
    }
    
    private func animateLogoAndAppName()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            // Scaling
            UIView.animate(withDuration: 0.4, animations: {
                self.logoImage.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.appName.transform = CGAffineTransform(translationX: 0, y: 100)
                
                })
            
            
        }
        
       
        
    }

    

}
