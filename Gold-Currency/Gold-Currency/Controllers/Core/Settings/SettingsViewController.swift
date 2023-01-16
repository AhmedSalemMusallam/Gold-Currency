//
//  SettingsViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 22/12/2022.
//

import UIKit

class SettingsViewController: UIViewController {

    //Mark:- outlets
    @IBOutlet weak var settingTableView: UITableView!
    //Mark:- Setting List
    let SettingsTableViewData = ["Dark Mode", "Language", "Default Metal", "Default Currency"]
    
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
    
    //Mark:- Override Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier
        {
        case "LanguageSettings":
            let destinationVC = segue.destination as? SettingDetailViewController
            destinationVC?.segueIdentifier = "LanguageSettings"
            destinationVC?.titleForBackButton = "  Language"
            destinationVC?.settingUITV = "Select Language"
        case "MetalSettings":
            let destinationVC = segue.destination as? SettingDetailViewController
            destinationVC?.segueIdentifier = "MetalSettings"
            destinationVC?.titleForBackButton = "  Metal Type"
            destinationVC?.settingUITV = "Select Metal Type"
        case "CurrencySettings":
            let destinationVC = segue.destination as? SettingDetailViewController
            destinationVC?.segueIdentifier = "CurrencySettings"
            destinationVC?.titleForBackButton = "  Currency"
            destinationVC?.settingUITV = "Select Currency"
        default:
            print("Error Happend")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Mark:- UITableView Self Delegation and DataSource
        settingTableView.delegate = self
        settingTableView.dataSource = self
        //Mark:- UITable Veiw registeration
        settingTableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: "SettingTableViewCell")
    }
    

    

}

// Mark:- Table data source and delegation
extension SettingsViewController :UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell",
                                                        for: indexPath)
        cell.textLabel?.text = SettingsTableViewData[indexPath.row]
        cell.textLabel?.font = UIFont(name:"Roboto Slab Bold", size:15)
        cell.tintColor = UIColor(named: "PrimaryColor")
        cell.backgroundColor = UIColor(named: "DarkColor")
        
        switch indexPath.row
        {
        case 0:
            
            cell.imageView?.image = UIImage(systemName: "moon")
            //here is programatically switch make to the table view
            let switchView = UISwitch(frame: .zero)
            
            //Mark:- Setting Application Mode
            if SceneDelegate.userData.bool(forKey: "LightMode")
            {
                switchView.setOn(false, animated: true)
            }else{
                switchView.setOn(true, animated: true)
            }
            switchView.tag = indexPath.row // for detect which row switch Changed
            switchView.addTarget(self, action: #selector(openView), for: .valueChanged)
            cell.accessoryView = switchView
            
            
        case 1:
            cell.imageView?.image = UIImage(systemName: "globe")
        case 2:
            cell.imageView?.image = UIImage(systemName: "scanner.fill")
        case 3:
            cell.imageView?.image = UIImage(systemName: "coloncurrencysign.circle.fill")
        default:
            print("Do Not Do Any Thing")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            print("Dark Mode")
        case 1:
            print("Language")
            performSegue(withIdentifier: "LanguageSettings", sender: nil)
        case 2:
            print("Metal Type")
            performSegue(withIdentifier: "MetalSettings", sender: nil)
        case 3:
            print("Currency Type")
            performSegue(withIdentifier: "CurrencySettings", sender: nil)
        default:
            print("Do Nothing.")
        }
    }
    
    //Mark:- Perform Switch operation
    @objc public func openView(sender: UISwitch){
        //Mark:- show action sheet for the user to confirm dark mode option
        let alert = UIAlertController(title: NSLocalizedString("Dark Mode Settings", comment: "action title"), message: NSLocalizedString("You have to Colse the App First ?", comment: "action message"), preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "action yes"), style: .default , handler:{ (UIAlertAction)in
            //Mark:- Dark mode action
            if(sender.isOn) {
                SceneDelegate.userData.set(false, forKey: "LightMode")
                self.view.overrideUserInterfaceStyle = .dark
            }else{
                SceneDelegate.userData.set(true, forKey: "LightMode")
                self.view.overrideUserInterfaceStyle = .light
            }
            
            exit(0)
            
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: "action no"), style: .destructive , handler:{ (UIAlertAction)in
            
            if(sender.isOn) {
                sender.setOn(false, animated: true)
            }else{
                sender.setOn(true, animated: true)
            }
            
            
            print("Do no thing.")
        }))
        
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
       
   }
    
}
