//
//  Data.swift
//  NftDisplay
//
//  Created by Work on 11/8/21.
//

import SwiftUI

struct AssetsResponse: Codable {
    var assets: [Nft]
}

struct Nft: Codable, Identifiable {
    var id: Int
    var token_id: String
    var name: String
    var description: String
    var image_url: String
    var animation_url: String?
}

class Api {
    func getNfts(publicAddress: String, completion: @escaping ([Nft]) -> ()) {
        print("Fetching NFTs")
        let url = URL(string: "https://api.opensea.io/api/v1/assets?owner=\(publicAddress)&order_direction=desc&offset=0&limit=20")!
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let response = try! JSONDecoder().decode(AssetsResponse.self, from: data!)
            print(response.assets)
            
            DispatchQueue.main.async {
                completion(response.assets)
            }
        }
        .resume()
    }
}
