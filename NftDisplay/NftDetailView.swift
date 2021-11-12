//
//  NftView.swift
//  NftDisplay
//
//  Created by Work on 11/8/21.
//

import SwiftUI

struct NftDetailView: View {
    
    let nft: Nft
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: nft.image_url)) { image in
                image.resizable().scaledToFill()
            } placeholder: { ProgressView() }
                .frame(width:100, height:100)
                .clipped()
            Text(nft.name)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)

            Text(nft.description)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(2)
        
            Text(nft.animation_url)
                .font(.body)
                .lineLimit(2)
                .padding()
        
            Text(nft.token_id)
                .font(.body)
                .lineLimit(2)
                .padding()
        }
    }
}

struct NftListDummy {
    
    static let dummy = [
        Nft(
            id: 0,
            token_id: "12345",
            name: "smiley-01",
            description: "test description",
            image_url: "https://lh3.googleusercontent.com/Ve9Kat0YeGHatYpI5OgcMIOW4qN4XDEGf7MymBeJWNyiHiQ8qyc_DxAIHVs1civpNHInUL02wgbN3mUrGfWVZIVVDvf1McNkcQsIlQ",
            animation_url: "https://lh3.googleusercontent.com/Ve9Kat0YeGHatYpI5OgcMIOW4qN4XDEGf7MymBeJWNyiHiQ8qyc_DxAIHVs1civpNHInUL02wgbN3mUrGfWVZIVVDvf1McNkcQsIlQ")
    ]
}

struct NftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NftDetailView(nft: NftListDummy.dummy.first!)
    }
}
