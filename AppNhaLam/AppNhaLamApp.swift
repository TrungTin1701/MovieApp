//
//  AppNhaLamApp.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/5/22.
//

import SwiftUI

@main
struct AppNhaLamApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(TicketViewModel())
        }
    }
}
