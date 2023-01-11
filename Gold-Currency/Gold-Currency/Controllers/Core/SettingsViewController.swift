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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        
        
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
        cell.textLabel?.font = UIFont(name:"Helvetica Neue Bold", size:17)
        
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
        print(indexPath.row)
    }
    
    @objc public func openView(sender: UISwitch){
        if(sender.isOn) {
            print("ON")
            SceneDelegate.userData.set(false, forKey: "LightMode")
            view.overrideUserInterfaceStyle = .dark
        }else{
            print("OFF")
            SceneDelegate.userData.set(true, forKey: "LightMode")
            view.overrideUserInterfaceStyle = .light
        }
   }
    
}
