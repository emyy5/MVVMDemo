//
//  NetworkServices.swift
//  MvvM
//
//  Created by Eman Khaled on 30/08/2023.
//

import Foundation
protocol MovieProtocol{
    static func fetchResult(completionHandler : @escaping(MyResult?)-> Void)
}
class NetworkService {
    
    static func fetchResult(completionHandler : @escaping(MyResult?)-> Void){
        let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_uw09j68u")
        guard let newUrl = url else {
            return
        }
        let req = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req) { data, response, error in
            do {
                let res = try JSONDecoder().decode(MyResult.self, from: data!)
                completionHandler(res)
                
            }catch let error {
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
            
            
        }
        task.resume()
    }
}

