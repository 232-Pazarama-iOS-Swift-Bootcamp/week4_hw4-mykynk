//
//  ProfileViewModel.swift
//  week4-hw4-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 19.10.2022.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class ProfileViewModel : ObservableObject {
    @Published var favoritePhotos = [Favorites]()
    @Published var libraryPhotos = [Favorites]()
    var email: String

    
    init(email: String) {
        self.email = email

        getFavorites()
        getLibraries()
    }
    
    
    func getFavorites(){
        let db = Firestore.firestore()
        db.collection("users").document(email).collection("favorites").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                    
                    
                }
                
                self.favoritePhotos = querySnapshot!.documents.map {queryDocumentSnapshot -> Favorites in
                    
                    let data = queryDocumentSnapshot.data()
                    let url = data["url"] as? String ?? ""
                    let userName = data["userName"] as? String ?? ""
                    return Favorites( url: url, userName: userName)

                }
            }
        }
        
    }
    func getLibraries(){
        let db = Firestore.firestore()
        db.collection("users").document(email).collection("libraries").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                    
                    
                }
                
                self.libraryPhotos = querySnapshot!.documents.map {queryDocumentSnapshot -> Favorites in
                    
                    let data = queryDocumentSnapshot.data()
                    let url = data["url"] as? String ?? ""
                    let userName = data["userName"] as? String ?? ""
                    return Favorites( url: url, userName: userName)

                }
            }
        }
        
    }
    
}
