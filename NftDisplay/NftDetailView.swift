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
                .frame(width:280, height:280)
                .clipped()
            TableView(nft: nft)
        }
        .navigationTitle("Details")
    }
}

struct TableView: View {

    var nft: Nft
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Name:")
                    .font(.system(size: 12, weight: .light))
                Spacer()
                Text(nft.name)
                    .font(.system(size: 12, weight: .light))
                    .fontWeight(.semibold)
                    .lineLimit(1)
            }
            HStack {
                Text("Description:")
                    .font(.system(size: 12, weight: .light))
                Spacer()
                Text(nft.description)
                    .font(.system(size: 12, weight: .light))
                    .lineLimit(1)
            }
            HStack {
                Text("Animation Url:")
                    .font(.system(size: 12, weight: .light))
                Spacer()
                Text(nft.animation_url ?? "")
                    .font(.system(size: 12, weight: .light))
                    .lineLimit(1)
            }
        }
        .padding()
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
