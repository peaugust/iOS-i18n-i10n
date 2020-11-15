//
//  ViewController.swift
//  iOS-i18n-l10n
//
//  Created by Pedro Freddi on 15/11/20.
//  Copyright © 2020 Pedro Freddi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "TEST".localized
        dateLabel.text = "Timezone: \(TimeZone.current) \nLocale: \(Locale.current)  \n\(UTCToLocal(stringDate: "2016-02-29 12:24:26"))"
        numberLabel.text = getNumberLocalized(using: 2016.49)
        currencyLabel.text = getCurrencyLocalized(using: 5987.66)
    }
    
    func UTCToLocal(stringDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let utcDate = dateFormatter.date(from: stringDate) else {
            return "NOT_AVAILABLE".localized
        }
        
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return dateFormatter.string(from: utcDate)
    }
    
    func getNumberLocalized(using number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale.current
        return "\("NUMBER_EXAMPLE".localized)\(numberFormatter.string(from: NSNumber(value: number)) ?? "NOT_AVAILABLE".localized)"
    }
    
    func getCurrencyLocalized(using number: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return "\("CURRENCY_EXAMPLE".localized)\(currencyFormatter.string(from: NSNumber(value: number)) ?? "NOT_AVAILABLE".localized)"
    }
}

