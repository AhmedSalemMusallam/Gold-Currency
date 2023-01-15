//
//  ExchangeCurrencyViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 13/01/2023.
//

import UIKit

class ExchangeCurrencyViewController: UIViewController {

    private var exchangeCurrency:[ExchangeCurrency]?
    // Mark :- grapping the exchange currency lists
    var exCurrencyList: [String] = []
    var exCurrencyKeysList: [String] = []
   
    //Mark:- Validation Flag
    var ValidationFlag : Bool = false
    
    //Mark:- Outlets
    @IBOutlet weak var FromCurrencyTV: UITextField!
    @IBOutlet weak var ToCurrencyTV: UITextField!
    @IBOutlet weak var AmountTV: UITextField!
    @IBOutlet weak var ShowPriceBtn: UIButton!
    //Mark:- Titles Outlets
    @IBOutlet weak var LastUpdateTitle: UILabel!
    @IBOutlet weak var ConvertedAmountTitle: UILabel!
    //Mark:- Values Outlets
    @IBOutlet weak var ConvertedAmountValue: UILabel!
    @IBOutlet weak var LastUpdateValue: UILabel!
    
    
    @IBAction func ShowPricesAction(_ sender: Any) {
       
        //Mark:- Show Prices Label
        LastUpdateTitle.isHidden = false
        ConvertedAmountTitle.isHidden = false
        ConvertedAmountValue.isHidden = false
        LastUpdateValue.isHidden = false
        
        
        
        //Mark:- setting the selected value to the API Caller
        guard let FromCurrencyTVValue = FromCurrencyTV.text else
        {
            ValidationFlag = false
            return
        }
        guard let ToCurrencyTVValue = ToCurrencyTV.text else
        {
            ValidationFlag = false
            return
        }
        guard let AmountTVValue = AmountTV.text else
        {
            ValidationFlag = false
            return
        }
        for (index , value) in ExchangeCurrencyDictionary
        {
            if FromCurrencyTVValue == value
            {
                Constants.exBaseCurrency = index
            }
                        
        }
        for (index , value) in ExchangeCurrencyDictionary
        {
            if ToCurrencyTVValue == value
            {
                Constants.toCurrency = index
            }
                        
        }
        
        Constants.amountCurrency = AmountTVValue
   
        if FromCurrencyTVValue == "From Currency" && ToCurrencyTVValue == "To Currency" && AmountTVValue == "Amount"
        {
            ValidationFlag = false
        }else{
            ValidationFlag = true
        }
        
        if !Constants.exBaseCurrency.isEmpty && !Constants.toCurrency.isEmpty && !Constants.amountCurrency.isEmpty && ValidationFlag
        {
            print(Constants.exBaseCurrency)
            print(Constants.toCurrency)
            print(Constants.amountCurrency)
            //Mark:- Fecth Prices
            fetchExchangePrices()
        }
        
    }
    
    //Mark:- UIPicker View
    var FromCurrencyPickerView = UIPickerView()
    var ToCurrencyPickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark:- Styling TVs
        FromCurrencyTV.layer.borderWidth = 2
        FromCurrencyTV.layer.cornerRadius = 5
        FromCurrencyTV.layer.borderColor = DarkColor?.cgColor
        ToCurrencyTV.layer.borderWidth = 2
        ToCurrencyTV.layer.cornerRadius = 5
        ToCurrencyTV.layer.borderColor = DarkColor?.cgColor
        AmountTV.layer.borderWidth = 2
        AmountTV.layer.cornerRadius = 5
        AmountTV.layer.borderColor = DarkColor?.cgColor
        AmountTV.attributedPlaceholder = NSAttributedString(string: "Amount", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkText])
        
        //Mark:- styling the button
        ShowPriceBtn.layer.cornerRadius = 5
        
        //Mark:- Hide the converted amout and last update by default
        LastUpdateTitle.isHidden = true
        ConvertedAmountTitle.isHidden = true
        ConvertedAmountValue.isHidden = true
        LastUpdateValue.isHidden = true
        
        // Mark:- setting UIpickers to the textfields
        FromCurrencyTV.inputView = FromCurrencyPickerView
        ToCurrencyTV.inputView = ToCurrencyPickerView
        
        // Mark:- Delegation and Datasource for UIPicker View Controller
        FromCurrencyPickerView.delegate = self
        FromCurrencyPickerView.dataSource = self
        ToCurrencyPickerView.delegate = self
        ToCurrencyPickerView.dataSource = self
        
        // Mark:- adding tags for all UIPicker view
        FromCurrencyPickerView.tag = 1
        ToCurrencyPickerView.tag = 2
        
        //Mark:- initializiing lists
        initializeMetalAndCurrencyLists()

       
    }
    
    //Mark:- Private Functions
    private func initializeMetalAndCurrencyLists()
    {
        for (index, value) in ExchangeCurrencyDictionary
        {
            exCurrencyKeysList.append(index)
            exCurrencyList.append(value)
        }
    }
    
    
    //MArk:- Fetch Exchange Prices
    private func fetchExchangePrices()
    {
        APICaller.shared.getExchangeCurrency{[weak self] results in

            switch results {
            case .success(let exchangeCurrency):
                self?.exchangeCurrency = exchangeCurrency
                DispatchQueue.main.async {
                    self?.ConvertedAmountValue.text = String(self?.exchangeCurrency?[0].converted ?? 0.0)
                    self?.LastUpdateValue.text = getDateFromTimeStamp(timeStamp: Double(self?.exchangeCurrency?[0].lastUpdate ?? 0.0))
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

//Mark:- UIPicker View Delegate and Datasource conforming
extension ExchangeCurrencyViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return exCurrencyList.count
        case 2:
            return exCurrencyList.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return exCurrencyList[row]
        case 2:
            return exCurrencyList[row]
        default:
            return "There's not data to show."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            FromCurrencyTV.text = exCurrencyList[row]
            FromCurrencyTV.resignFirstResponder()
        case 2:
            ToCurrencyTV.text = exCurrencyList[row]
            ToCurrencyTV.resignFirstResponder()
        default:
            return
        }
    }
    
}
