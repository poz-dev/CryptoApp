//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Kresimir Ivanjko on 04.03.2024..
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
