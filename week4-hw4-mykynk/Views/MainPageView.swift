//
//  MainPageView.swift
//  week4-hw4-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 17.10.2022.
//

import SwiftUI

struct MainPageView: View {
    
    var email: String
    var body: some View {
        TabView {
            HomeView(email: email).tabItem{
                Text("Home")
            }
            SearchView(email: email).tabItem{
                Text("Search")
            }
            ProfileView(email: email).tabItem{
                Text("Profile")
            }
        }
        
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(email: "")
    }
}
