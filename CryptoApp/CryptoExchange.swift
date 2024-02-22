//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Kresimir Ivanjko on 31.01.2024..
//

import SwiftUI

@main
struct CryptoExchange: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
