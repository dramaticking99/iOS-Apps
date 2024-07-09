//
//  PostViewModal.swift
//  Hungry2GrowAssignment
//
//  Created by Chetan Sanwariya on 13/04/24.
//

import Foundation

class PostViewModal : ObservableObject {
    
    @Published var postArray: [PostModal] = []
    
    func fetchPostData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let postArray = try JSONDecoder().decode([PostModal].self, from: data)
                    DispatchQueue.main.async {
                        self.postArray = postArray
                    }
                } catch {
                    print("error decoding the JOSN: \(error)")
                }
            } else if let e = error {
                print("Error fetching data: \(e)")
            }
        } .resume()
    }
}
