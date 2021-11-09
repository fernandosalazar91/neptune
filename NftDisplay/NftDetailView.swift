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
            ImageDetailView(withURL: nft.image_url)
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

struct ImageDetailView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:180)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct NftListDummy {
    
    static let dummy = [
        Nft(
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
