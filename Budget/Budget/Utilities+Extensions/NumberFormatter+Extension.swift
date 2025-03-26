//
//  NumberFormatter+Extension.swift
//  Budget
//
//  Created by Charles on 26/03/25.
//

import Foundation


extension NumberFormatter {
  
    static var currency:NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
