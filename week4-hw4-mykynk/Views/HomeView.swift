//
//  HomeView.swift
//  week4-hw4-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 17.10.2022.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel = HomeViewModel()
    var email: String
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center) {
                if self.homeViewModel.isCompleted {
                    let photosModel = self.homeViewModel.flickerData!
                    let photos = photosModel.photos.photo
                    ForEach(0..<photos.count){ i in
                        let photo = photos[i]
                        VStack
                        {                        Text(photo.ownername)
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue)
                                .multilineTextAlignment(.leading)
                            AsyncImage(
                                url: URL(string : photo.urlC ?? ""),
                                content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                }, placeholder: {
                                    Color.gray
                                })
                            .frame(width: 500, height: 500)
                            .mask(RoundedRectangle(cornerRadius: 16))
                            HStack{
                                Button(action: {addData(url: photo.urlC ?? "", userName: photo.ownername, path: "favorites")}) {
                                    Text("Favoriye Ekle").foregroundColor(Color.white).padding(.all,10).background(RoundedRectangle(
                                        cornerRadius: 10)
                                        .foregroundColor(Color.orange))
                                }.padding(.trailing,20)
                                Button(action: {addData(url: photo.urlC ?? "", userName: photo.ownername, path: "libraries")}) {
                                    Text("Kitaplığa Kaydet").foregroundColor(Color.white).padding(.all,10).background(RoundedRectangle(
                                        cornerRadius: 10)
                                        .foregroundColor(Color.orange))
                                }.padding(.leading,20)
                                
                            }
                        }.padding(.top,16)
                    }
                    
                }
            }
        }
    }
    
    func addData(url : String, userName: String, path:String){
        let db = Firestore.firestore()
        db.collection("users").document(email).collection(path).addDocument(data: ["url": url,"userName": userName])
    }
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(email: "")
    }
}
