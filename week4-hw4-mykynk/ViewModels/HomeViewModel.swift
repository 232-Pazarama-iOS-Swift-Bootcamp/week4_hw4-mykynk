//
//  HomeViewModel.swift
//  week4-hw4-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 18.10.2022.
//

import Foundation

class HomeViewModel : ObservableObject {
    private var apiService : APIService!
    @Published var isCompleted : Bool = false
    @Published var flickerData : Photos!
    
    @Published var loginedEmail : String = ""
    
    
    init() {
        self.apiService =  APIService()
        callFuncToGetFlickerData()
    }
    
    func callFuncToGetFlickerData() {
        self.apiService.apiToGetPhotos { (flickerData) in
            self.flickerData = flickerData
           // print(flickerData)
            self.isCompleted = true
            print(self.isCompleted)
            
        }
    }
    
}
