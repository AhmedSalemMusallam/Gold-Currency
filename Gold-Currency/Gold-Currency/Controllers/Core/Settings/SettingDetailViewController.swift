//
//  languageViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 11/01/2023.
//

import UIKit

class SettingDetailViewController: UIViewController {

    //Mark:- Variables
    var segueIdentifier: String?
    var titleForBackButton: String?
    var settingUITV: String?
    var pickerKeysList: [String] = []
    var pickerList: [String] = []
    var settingsPickerView = UIPickerView()
  
    //Mark:- Outlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var settingSelectionUITextField: UITextField!
    @IBOutlet weak var saveSetting: UIButton!
    
    //Mark:- Actions
    //Mark:- Go Back Action
    @IBAction func actionGoBack(_ sender: Any) {
        dismiss(animated: true)
    }
    //Mark:- save user settings
    @IBAction func saveSettings(_ sender: Any) {
        showSettingsActionSheet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Mark:- styling Weidgets
        settingSelectionUITextField.layer.borderWidth = 2
        settingSelectionUITextField.layer.cornerRadius = 5
        settingSelectionUITextField.layer.borderColor = DarkColor?.cgColor
        
        //Mark:- styling the button
        saveSetting.layer.cornerRadius = 5
        
        //Mark:- setting value from segue
        backButton.setTitle(titleForBackButton, for: .normal)
        settingSelectionUITextField.text = settingUITV
        
        
        // Mark:- setting UIpickers to the textfields
        settingSelectionUITextField.inputView = settingsPickerView
        
        // Mark:- Delegation and Datasource for UIPicker View Controller
        settingsPickerView.delegate = self
        settingsPickerView.dataSource = self
        
        // Mark:- adding tags for all UIPicker view
        settingsPickerView.tag = 1
        
        //Mark:- Initialize the UIPicker Lists
        initializeUIPickerLists()
    }
    
    //Mark:- Private Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    //Mark:- Initailize UIpicker indeceis and value array
    private func initializeUIPickerLists()
    {
        if segueIdentifier == "LanguageSettings"
        {
            for (index, value) in languages
            {
                pickerKeysList.append(index)
                pickerList.append(value)
            }
        }else if segueIdentifier == "MetalSettings"
        {
            for (index, value) in metalTypesDictionary
            {
                pickerKeysList.append(index)
                pickerList.append(value)
            }
        }else if segueIdentifier == "CurrencySettings"
        {
            for (index, value) in currencyDictionary
            {
                pickerKeysList.append(index)
                pickerList.append(value)
            }
            
        }else{
            print("There's no values in the dictionary.")
        }
    }
    //Mark:- show action sheet for the user to confirm or no the saving process
    private func showSettingsActionSheet()
        {
            let alert = UIAlertController(title: NSLocalizedString("Save Seetings", comment: "action title"), message: NSLocalizedString("Do You Want To Save ?", comment: "action message"), preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "action yes"), style: .default , handler:{ (UIAlertAction)in
                //Mark:- to save settings for lang, metal and currency
                self.saveSettings()
                
            }))
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: "action no"), style: .destructive , handler:{ (UIAlertAction)in
                print("Do no thing.")
            }))
            
            
            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        }
    
    //Mark:- the saving action to the user defaults
    private func saveSettings()
    {
        guard let segueIdentifier = segueIdentifier else { return }
        
        if segueIdentifier == "LanguageSettings"
        {
            SceneDelegate.userData.set(settingSelectionUITextField.text, forKey: "LanguageSettings")
        }else if segueIdentifier == "MetalSettings"
        {
            SceneDelegate.userData.set(settingSelectionUITextField.text, forKey: "MetalSettings")
        }else if segueIdentifier == "CurrencySettings"
        {
            SceneDelegate.userData.set(settingSelectionUITextField.text, forKey: "CurrencySettings")
        }else{
            print("There's no values in the dictionary.")
        }
    }
    

}

//Mark:- UIPicker View Delegate and Datasource conforming
extension SettingDetailViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return pickerList.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return pickerList[row]
        default:
            return "There's not data to show."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            settingSelectionUITextField.text = pickerList[row]
            settingSelectionUITextField.resignFirstResponder()
            
        default:
            return
        }
    }
}
