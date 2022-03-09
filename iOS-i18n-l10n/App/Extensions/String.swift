//
//  String.swift
//  iOS-i18n-l10n
//
//  Created by Jungle Devs on 09/03/22.
//  Copyright © 2022 Pedro Freddi. All rights reserved.
//
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(with values: String...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: values)
    }
}
