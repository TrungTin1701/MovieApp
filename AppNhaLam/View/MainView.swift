//
//  MainView.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/5/22.
//

import SwiftUI


struct MainView: View {
    @State var currentTab : Tab	= .home
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        NavigationView{
            VStack(spacing: 0.0) {
                TabView(selection: $currentTab) {
                    HomeView()
                        .tag(Tab.home)
                    
                    Text("Location")
                        .tag(Tab.location)
                    
                    TicketsView()
                        .tag(Tab.ticket)
                    
                    Text("Category")
                        .tag(Tab.category)
                    
                    Text("Profile")
                        .tag(Tab.profile)
                    
                }
                CustomTabBar(currentTab: $currentTab)
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TicketViewModel())
    }
}
