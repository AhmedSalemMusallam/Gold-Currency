//
//  MainViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 22/12/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    

    // Mark :- grapping the metal and currency lists
    var metalTypesList: [String] = []
    var metalTypesKeysList: [String] = []
    var currencyList: [String] = []
    var currencyKeysList: [String] = []
    
    // Mark:- User Default variables
    var defaultMetalType : String?
    var defaultCurrency : String?
    
    //Mark:- Validation Flag
    var ValidationFlag : Bool = false
    
    //Mark:- Outlets
    @IBOutlet weak var metalTypeSettingTV: UITextField!
    @IBOutlet weak var currencyTypeSettingTV: UITextField!
    
    
    @IBOutlet weak var gram_24KLabel: UILabel!
    @IBOutlet weak var gram_22KLabel: UILabel!
    @IBOutlet weak var gram_21KLabel: UILabel!
    @IBOutlet weak var gram_20KLabel: UILabel!
    @IBOutlet weak var gram_18KLabel: UILabel!
    
    
    @IBOutlet weak var gram_24KTitleLabel: UILabel!
    @IBOutlet weak var gram_22KTitleLabel: UILabel!
    @IBOutlet weak var gram_21KTitleLabel: UILabel!
    @IBOutlet weak var gram_20KTitleLabel: UILabel!
    @IBOutlet weak var gram_18KTitleLabel: UILabel!
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var underLogoLabel: UILabel!
    
    
    
    @IBOutlet weak var showPrices: UIButton!
    
    //Mark:- show Prices button action
    
    @IBAction func showPricesAction(_ sender: Any) {
        //Mark:- Show Prices Label
        gram_24KLabel.isHidden = false
        gram_22KLabel.isHidden = false
        gram_21KLabel.isHidden = false
        gram_20KLabel.isHidden = false
        gram_18KLabel.isHidden = false
        
        gram_24KTitleLabel.isHidden = false
        gram_22KTitleLabel.isHidden = false
        gram_21KTitleLabel.isHidden = false
        gram_20KTitleLabel.isHidden = false
        gram_18KTitleLabel.isHidden = false
        
        //Mark :- Hide the logo and label
        logoImageView.isHidden = true
        underLogoLabel.isHidden = true
        
        //Mark:- setting the selected value to the API Caller
        guard let metalTypeTVValue = metalTypeSettingTV.text else
        {
            ValidationFlag = false
            return
        }
        guard let currencyTVValue = currencyTypeSettingTV.text else {
            ValidationFlag = false
            return
        }
        for (index , value) in metalTypesDictionary
        {
            if metalTypeTVValue == value
            {
                Constants.metalKey = index
            }
                        
        }
        for (index , value) in currencyDictionary
        {
            if currencyTVValue == value
            {
                Constants.currencyKey = index
            }
                        
        }
        
   
        if metalTypeTVValue == "Select Metal" && currencyTVValue == "Select Currency"
        {
            ValidationFlag = false
        }else{
            ValidationFlag = true
        }
        
        if !Constants.metalKey.isEmpty && !Constants.currencyKey.isEmpty && ValidationFlag
        {
            print(Constants.metalKey)
            print(Constants.currencyKey)
            //Mark:- Fecth Prices
            fetchMetalPrices()
        }
        
        
    }
    
    
    
    var metalTypePickerView = UIPickerView()
    var currencyTypePickerView = UIPickerView()

    private var metals:[Metal]?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Mark:- Setting the Default value for Metal And Currency
        setDefaultMetalAndCurrencyValuesIfExists()
        
        //Mark:- Setting Application Mode
        if SceneDelegate.userData.bool(forKey: "LightMode")
        {
            view.overrideUserInterfaceStyle = .light
        }else{
            view.overrideUserInterfaceStyle = .dark
        }
        
        // Mark:- seeting icons for text fields
        metalTypeSettingTV.layer.borderWidth = 2
        metalTypeSettingTV.layer.cornerRadius = 5
        metalTypeSettingTV.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        currencyTypeSettingTV.layer.borderWidth = 2
        currencyTypeSettingTV.layer.cornerRadius = 5
        currencyTypeSettingTV.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        // Mark:- Styling Labels
        gram_24KLabel.layer.borderWidth = 2
        gram_24KLabel.layer.cornerRadius = 2
        gram_24KLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        gram_22KLabel.layer.borderWidth = 2
        gram_22KLabel.layer.cornerRadius = 2
        gram_22KLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        gram_21KLabel.layer.borderWidth = 2
        gram_21KLabel.layer.cornerRadius = 2
        gram_21KLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        gram_20KLabel.layer.borderWidth = 2
        gram_20KLabel.layer.cornerRadius = 2
        gram_20KLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        gram_18KLabel.layer.borderWidth = 2
        gram_18KLabel.layer.cornerRadius = 2
        gram_18KLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        gram_24KTitleLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        gram_22KTitleLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        gram_21KTitleLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        gram_20KTitleLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        gram_18KTitleLabel.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        //Mark:- styling the button
        showPrices.layer.cornerRadius = 5
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemBackground
        
        
        
        //Mark:- Setting Application Mode
        if SceneDelegate.userData.bool(forKey: "LightMode")
        {
            view.overrideUserInterfaceStyle = .light
        }else{
            view.overrideUserInterfaceStyle = .dark
        }
        
        
        //Mark:- Hide Prices Label
        gram_24KLabel.isHidden = true
        gram_22KLabel.isHidden = true
        gram_21KLabel.isHidden = true
        gram_20KLabel.isHidden = true
        gram_18KLabel.isHidden = true
        
        gram_24KTitleLabel.isHidden = true
        gram_22KTitleLabel.isHidden = true
        gram_21KTitleLabel.isHidden = true
        gram_20KTitleLabel.isHidden = true
        gram_18KTitleLabel.isHidden = true
        
        
        // Mark:- setting UIpickers to the textfields
        metalTypeSettingTV.inputView = metalTypePickerView
        currencyTypeSettingTV.inputView = currencyTypePickerView


        // Marks:- setting the style of the text fields
        metalTypeSettingTV.textAlignment = .center
        currencyTypeSettingTV.textAlignment = .center

        // Mark:- Delegation and Datasource for UIPicker View Controller
        metalTypePickerView.delegate = self
        metalTypePickerView.dataSource = self
        currencyTypePickerView.delegate = self
        currencyTypePickerView.dataSource = self

        // Mark:- adding tags for all UIPicker view
        metalTypePickerView.tag = 1
        currencyTypePickerView.tag = 2
        
        //Mark:- initializiing lists
        initializeMetalAndCurrencyLists()
        
        
    }
    

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    

    // Mark:- Private function
    private func fetchMetalPrices()
    {
        APICaller.shared.getPrices{[weak self] results in

            switch results {
            case .success(let metal):
                self?.metals = metal
                DispatchQueue.main.async {
                    self?.gram_18KLabel.text = String(self?.metals?[0].price_gram_18k ?? 0.0)
                    self?.gram_20KLabel.text = String(self?.metals?[0].price_gram_20k ?? 0.0)
                    self?.gram_21KLabel.text = String(self?.metals?[0].price_gram_21k ?? 0.0)
                    self?.gram_22KLabel.text = String(self?.metals?[0].price_gram_22k ?? 0.0)
                    self?.gram_24KLabel.text = String(self?.metals?[0].price_gram_24k ?? 0.0)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func initializeMetalAndCurrencyLists()
    {
        for (index, value) in metalTypesDictionary
        {
            metalTypesKeysList.append(index)
            metalTypesList.append(value)
        }
        
        for (index, value) in currencyDictionary
        {
            currencyKeysList.append(index)
            currencyList.append(value)
        }
    }
    
    private func setDefaultMetalAndCurrencyValuesIfExists()
    {
        guard let defaultMetalType = SceneDelegate.userData.string(forKey: "MetalSettings") else { return }
        if !defaultMetalType.isEmpty
        {
            metalTypeSettingTV.text = defaultMetalType
        }
        guard let defaultCurrency = SceneDelegate.userData.string(forKey: "CurrencySettings") else { return }
        
        if !defaultCurrency.isEmpty
        {
            currencyTypeSettingTV.text = defaultCurrency
        }
    }
    
    
}

//Mark:- UIPicker View Delegate and Datasource conforming
extension MainViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return metalTypesList.count
        case 2:
            return currencyList.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return metalTypesList[row]
        case 2:
            return currencyList[row]
        default:
            return "There's not data to show."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            metalTypeSettingTV.text = metalTypesList[row]
            metalTypeSettingTV.resignFirstResponder()
        case 2:
            currencyTypeSettingTV.text = currencyList[row]
            currencyTypeSettingTV.resignFirstResponder()
            
        default:
            return
        }
    }
}


    

