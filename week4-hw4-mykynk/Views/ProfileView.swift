//
//  ProfileView.swift
//  week4-hw4-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 17.10.2022.
//

import SwiftUI


struct ProfileView: View {
    
    @State var profileViewModel : ProfileViewModel
    var email: String
    
    init(email: String) {
        self.email = email
        self.profileViewModel =  ProfileViewModel(email: email)
    }
    
    var body: some View {
        
        ScrollView{
            VStack {
                Button(action: {profileViewModel.getFavorites()
                    profileViewModel.getLibraries()
                    
                }){
                    Text("Yenile").fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.leading)
                }
                HStack(alignment: .top){
                    VStack {
                        Text("Favoriler").fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .multilineTextAlignment(.leading).font(.system(size: 20)).padding(.all,50)
                        
                        ForEach(0..<profileViewModel.favoritePhotos.count){ i in
                            let photo = profileViewModel.favoritePhotos[i]
                            HStack
                            {         VStack{                Text(photo.userName)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.blue)
                                    .multilineTextAlignment(.leading)
                                AsyncImage(
                                    url: URL(string : photo.url ),
                                    content: { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    }, placeholder: {
                                        Color.gray
                                    })
                                .frame(width: 100, height: 100)
                                .mask(RoundedRectangle(cornerRadius: 16)) }
                            }.padding(.top,16).frame(width: 200, height: 150)
                        }}
                    
                    VStack {
                        Text("Kaydedilenler").fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .multilineTextAlignment(.leading).font(.system(size: 20)).padding(.all,50)
                        ForEach(0..<profileViewModel.libraryPhotos.count){ i in
                            let photo = profileViewModel.libraryPhotos[i]
                            HStack
                            {
                                VStack{
                                    Text(photo.userName)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.blue)
                                        .multilineTextAlignment(.leading)
                                    AsyncImage(
                                        url: URL(string : photo.url ),
                                        content: { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                        }, placeholder: {
                                            Color.gray
                                        })
                                    .frame(width: 100, height: 100)
                                    .mask(RoundedRectangle(cornerRadius: 16))
                                }
                                
                            }.padding(.top,16)
                        }
                    }
                    
                }
                
            }
            
            
        }
        
        
    }
}
