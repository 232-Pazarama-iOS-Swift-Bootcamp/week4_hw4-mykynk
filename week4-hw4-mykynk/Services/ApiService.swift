//
//  ApiService.swift
//  week4-hw4-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 18.10.2022.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&format=json&nojsoncallback=1&api_key=cb43d0de658a4d9e6cabac4c762c732e&extras=owner_name%2C+url_c")!
    
    func apiToGetPhotos(completion : @escaping (Photos) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let wtData = try! jsonDecoder.decode(Photos.self, from: data)
                    completion(wtData)
            }
        }.resume()
    }
}
