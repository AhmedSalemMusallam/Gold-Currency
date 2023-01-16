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
    
    //Mark:- UITAble View Data
    private var CurrencyRatesTableData : [String: String] = [:]
    //Mark:- Validation Flag
    var ValidationFlag : Bool = false
    
    // Mark :- grapping the exchange currency lists
    var BaseCurrencyList: [String] = []
    var BaseCurrencyKeysList: [String] = []
    
    //Mark:- UIPicker View
    var BaseCurrencyPickerView = UIPickerView()
    
    //Mark:- Outlets
    @IBOutlet weak var CurrencyRateLabel: UILabel!
    @IBOutlet weak var BaseCurrencyTV: UITextField!
    @IBOutlet weak var ShowRatesBtn: UIButton!
    @IBOutlet weak var RatesTableViews: UITableView!
    
    
    //Mark:- show Rates Button Action
    @IBAction func ShowRatesAction(_ sender: Any) {
        
        //Mark:- UnHide The Table View As A Default Action
        RatesTableViews.isHidden = false

        //Mark:- setting the selected value to the API Caller
        guard let BaseCurrencyTV = BaseCurrencyTV.text else
        {
            ValidationFlag = false
            return
        }
        
        for (index , value) in ExchangeCurrencyDictionary
        {
            if BaseCurrencyTV == value
            {
                Constants.baseCurrency = index
            }
                        
        }
        
        if BaseCurrencyTV == "Choose Base Currency"
        {
            ValidationFlag = false
        }else{
            ValidationFlag = true
        }
        
        if !Constants.baseCurrency.isEmpty && ValidationFlag
        {
            print(Constants.baseCurrency)
            
            //Mark:- Call the API
            fetchExchangePrices()
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

        //Mark:- Styling TVs
        BaseCurrencyTV.layer.borderWidth = 2
        BaseCurrencyTV.layer.cornerRadius = 5
        BaseCurrencyTV.layer.borderColor = UIColor(named: "LightColor")?.cgColor
        
        //Mark:- styling the button
        ShowRatesBtn.layer.cornerRadius = 5
        
        
        
        // Mark:- setting UIpickers to the textfields
        BaseCurrencyTV.inputView = BaseCurrencyPickerView
        
        // Mark:- Delegation and Datasource for UIPicker View Controller
        BaseCurrencyPickerView.delegate = self
        BaseCurrencyPickerView.dataSource = self
        
        // Mark:- adding tags for all UIPicker view
        BaseCurrencyPickerView.tag = 1
        
        //Mark:- initializiing lists
        initializeCurrencyLists()
        
        // Mark:- UITableView Self Delegation and DataSource
        RatesTableViews.delegate = self
        RatesTableViews.dataSource = self
        
        //Mark:- UITable Veiw registeration
        RatesTableViews.register(UITableViewCell.self,
                                forCellReuseIdentifier: "TableViewCell")
        
        //Mark:- Hide The Table View As A Default Action
        RatesTableViews.isHidden = true
        
        
       
    }
    
    //Mark:- Private Functions
    private func initializeCurrencyLists()
    {
        for (index, value) in ExchangeCurrencyDictionary
        {
            BaseCurrencyKeysList.append(index)
            BaseCurrencyList.append(value)
        }
    }
    
    //Mark:- UITable View Delegation and Data Source
    func setTabelViewDataSourceDelegate(dataSourceDelegate: UITableViewDelegate & UITableViewDataSource, forRow row: Int) {
        RatesTableViews.delegate = dataSourceDelegate
        RatesTableViews.dataSource = dataSourceDelegate
        RatesTableViews.reloadData()
    }
    
    //MArk:- Fetch Currency Rates
    private func fetchExchangePrices()
    {
        APICaller.shared.getCurrencyRates{[weak self] results in

            switch results {
            case .success(let currencyRates):
                self?.currencyRates = currencyRates
                DispatchQueue.main.async {
                    //                    self?.ConvertedAmountValue.text = String(self?.exchangeCurrency?[0].converted ?? 0.0)
                    //                    self?.LastUpdateValue.text = self?.getDateFromTimeStamp(timeStamp: Double(self?.exchangeCurrency?[0].lastUpdate ?? 0.0))
//                    print(self?.currencyRates?[0].lastUpdate ?? 0.0)
//                    print(String(self?.currencyRates?[0].rates.EUR ?? 0.0) + "salem")
                    
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].lastUpdate ?? 0.0), forKey: "lastUpdate")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].base ?? "base"), forKey: "base")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.EUR ?? 0.0), forKey: "EUR")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.USD ?? 0.0), forKey: "USD")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.JPY ?? 0.0), forKey: "JPY")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.BGN ?? 0.0), forKey: "BGN")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.CZK ?? 0.0), forKey: "CZK")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.DKK ?? 0.0), forKey: "DKK")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.GBP ?? 0.0), forKey: "GBP")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.HUF ?? 0.0), forKey: "HUF")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.PLN ?? 0.0), forKey: "PLN")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.RON ?? 0.0), forKey: "RON")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.SEK ?? 0.0), forKey: "SEK")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.CHF ?? 0.0), forKey: "CHF")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.ISK ?? 0.0), forKey: "ISK")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.NOK ?? 0.0), forKey: "NOK")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.ISK ?? 0.0), forKey: "TRY")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.TRY ?? 0.0), forKey: "AUD")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.AUD ?? 0.0), forKey: "BRL")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.BRL ?? 0.0), forKey: "CAD")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.CAD ?? 0.0), forKey: "CNY")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.CNY ?? 0.0), forKey: "HKD")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.HKD ?? 0.0), forKey: "IDR")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.IDR ?? 0.0), forKey: "INR")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.INR ?? 0.0), forKey: "KRW")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.KRW ?? 0.0), forKey: "MXN")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.MXN ?? 0.0), forKey: "MYR")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.MYR ?? 0.0), forKey: "NZD")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.NZD ?? 0.0), forKey: "PHP")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.PHP ?? 0.0), forKey: "SGD")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.SGD ?? 0.0), forKey: "THB")
                    self?.CurrencyRatesTableData.updateValue(String(self?.currencyRates?[0].rates.THB ?? 0.0), forKey: "ZAR")
                    
                    
                    
                    
                    //Mark:- Reload Data
                    self?.RatesTableViews.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    

}

// Mark:- Table data source and delegation
extension CurrencyRatesViewController :UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrencyRatesTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                        for: indexPath)
        cell.textLabel?.text = "Test Text"
        cell.textLabel?.font = UIFont(name:"Roboto Slab Bold", size:15)
        cell.tintColor = UIColor(named: "PrimaryColor")
        cell.imageView?.image = UIImage(systemName: "coloncurrencysign.circle.fill")
//        print(indexPath.row)
    
        switch indexPath.row
        {
        
        case 0:
            cell.textLabel?.text = "Base Currency : \(CurrencyRatesTableData["base"] ?? "??")"
//            cell.backgroundColor = UIColor(named: "DarkColor")
//            cell.tintColor = UIColor(named: "PrimaryColor")
//            cell.textLabel?.textColor = UIColor(named: "LightColor")
//            cell.contentView.layer.cornerRadius = 5
           
        case 1:
            cell.textLabel?.text = "Last Update : \(getDateFromTimeStamp(timeStamp : Double(CurrencyRatesTableData["lastUpdate"] ?? "0") ?? 0.0))"
            cell.imageView?.image = UIImage(systemName: "timer")
        
        case 2:
            cell.textLabel?.text = "Euro : \(CurrencyRatesTableData["EUR"] ?? "??")"
        case 3:
            cell.textLabel?.text = "United States Dollar : \(CurrencyRatesTableData["USD"] ?? "??")"
        case 4:
            cell.textLabel?.text = "Japanese Yen : \(CurrencyRatesTableData["JPY"] ?? "??")"
        case 5:
            cell.textLabel?.text = "Bulgarian Lev : \(CurrencyRatesTableData["BGN"] ?? "??")"
        case 6:
            cell.textLabel?.text = "Czech Koruna : \(CurrencyRatesTableData["CZK"] ?? "??")"
        case 7:
            cell.textLabel?.text = "Danish Krone : \(CurrencyRatesTableData["DKK"] ?? "??")"
        case 8:
            cell.textLabel?.text = "Pound sterling : \(CurrencyRatesTableData["GBP"] ?? "??")"
        case 9:
            cell.textLabel?.text = "Hungarian Forint : \(CurrencyRatesTableData["HUF"] ?? "??")"
        case 10:
            cell.textLabel?.text = "Polish Zloty : \(CurrencyRatesTableData["PLN"] ?? "??")"
        case 11:
            cell.textLabel?.text = "Romanian Leu : \(CurrencyRatesTableData["RON"] ?? "??")"
        case 12:
            cell.textLabel?.text = "Swedish Krona : \(CurrencyRatesTableData["SEK"] ?? "??")"
        case 13:
            cell.textLabel?.text = "Swiss Franc : \(CurrencyRatesTableData["CHF"] ?? "??")"
        case 14:
            cell.textLabel?.text = "Icelandic Króna : \(CurrencyRatesTableData["ISK"] ?? "??")"
        case 15:
            cell.textLabel?.text = "Norwegian Krone : \(CurrencyRatesTableData["NOK"] ?? "??")"
        case 16:
            cell.textLabel?.text = "Turkish lira : \(CurrencyRatesTableData["TRY"] ?? "??")"
        case 17:
            cell.textLabel?.text = "Australian Dollar : \(CurrencyRatesTableData["AUD"] ?? "??")"
        case 18:
            cell.textLabel?.text = "Brazilian Real : \(CurrencyRatesTableData["BRL"] ?? "??")"
        case 19:
            cell.textLabel?.text = "Canadian Dollar : \(CurrencyRatesTableData["CAD"] ?? "??")"
        case 20:
            cell.textLabel?.text = "Chinese Yuan : \(CurrencyRatesTableData["CNY"] ?? "??")"
        case 21:
            cell.textLabel?.text = "Hong Kong Dollar : \(CurrencyRatesTableData["HKD"] ?? "??")"
        case 22:
            cell.textLabel?.text = "Indonesian Rupiah : \(CurrencyRatesTableData["IDR"] ?? "??")"
        case 23:
            cell.textLabel?.text = "Indian Rupee : \(CurrencyRatesTableData["INR"] ?? "??")"
        case 24:
            cell.textLabel?.text = "South Korean won : \(CurrencyRatesTableData["KRW"] ?? "??")"
        case 25:
            cell.textLabel?.text = "Mexican Peso : \(CurrencyRatesTableData["MXN"] ?? "??")"
        case 26:
            cell.textLabel?.text = "Malaysian Ringgit : \(CurrencyRatesTableData["MYR"] ?? "??")"
        case 27:
            cell.textLabel?.text = "New Zealand Dollar : \(CurrencyRatesTableData["NZD"] ?? "??")"
        case 28:
            cell.textLabel?.text = "Philippine peso : \(CurrencyRatesTableData["PHP"] ?? "??")"
        case 29:
            cell.textLabel?.text = "Singapore Dollar : \(CurrencyRatesTableData["SGD"] ?? "??")"
        case 30:
            cell.textLabel?.text = "Thai Baht : \(CurrencyRatesTableData["THB"] ?? "??")"
        case 31:
            cell.textLabel?.text = "South African Rand : \(CurrencyRatesTableData["ZAR"] ?? "??")"
        
        default:
            print("Normal Cell")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            print("First Cell")
        }
            
    }
    
    
}

//Mark:- UIPicker View Delegate and Datasource conforming
extension CurrencyRatesViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return BaseCurrencyList.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return BaseCurrencyList[row]
        default:
            return "There's not data to show."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            BaseCurrencyTV.text = BaseCurrencyList[row]
            BaseCurrencyTV.resignFirstResponder()
        default:
            return
        }
    }
    
}
