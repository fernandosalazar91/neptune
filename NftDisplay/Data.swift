//
//  Data.swift
//  NftDisplay
//
//  Created by Work on 11/8/21.
//

import Foundation
import SwiftUI

struct Nft: Codable, Identifiable {
    let id = UUID()
    var token_id: String
    var name: String
    var description: String
    var image_url: String
    var animation_url: String
}

class Api {
    func getNfts(completion: @escaping ([Nft]) -> ()) {
        guard let url = URL(string: "http://localhost:4000/assets") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let nfts = try! JSONDecoder().decode([Nft].self, from: data!)
            print(nfts)
            
            DispatchQueue.main.async {
                completion(nfts)
            }
        }
        .resume()
    }
}
