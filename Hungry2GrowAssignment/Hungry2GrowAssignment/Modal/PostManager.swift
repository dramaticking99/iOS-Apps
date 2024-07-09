//
//  PostManager.swift
//  Hungry2GrowAssignment
//
//  Created by Chetan Sanwariya on 12/04/24.
//

import Foundation



class PostManager {
    
    func fetchPostData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        if let safeURL = url {
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: safeURL) { data, response, error in
                
                if let e = error {
                    print("error")
                    return
                }
                
                if let safeData = data {
                    let postArray = self.DecodePostJOSNData(data: safeData)
                    //have the post data here
                } else {
                    print("No Data Recieved")
                }
            }
            task.resume()
        }
    }
    
    func DecodePostJOSNData( data : Data) -> [PostModal] {
        let decoder = JSONDecoder()
        do {
            let postArray = try decoder.decode(PostModal.self, from: data)
        } catch {
            print("error decoing the JSON Data")
        }
        return postArray
    }
    
    
}
