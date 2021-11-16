//
//  ContentView.swift
//  NftDisplay
//
//  Created by Work on 11/7/21.
//

import SwiftUI

struct NftListView: View {
    
    @State var nfts: [Nft] = []
    let walletAddress: String
    let api = Api()
    
    var body: some View {
        List(nfts) { nft in
            NavigationLink(destination: NftDetailView(nft: nft), label: {
                NftCell(nft: nft)
            })
        }
        .onAppear {
            api.getNfts(publicAddress: walletAddress) { (nfts) in
                self.nfts = nfts
            }
        }
        .navigationTitle("My NFT Collection")
    }
}

struct NftCell: View {
    
    var nft: Nft
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: nft.image_url)) { image in
                image.resizable().scaledToFill()
            } placeholder: { ProgressView() }
                .frame(width:100, height:100)
                .clipped()
            VStack(alignment: .leading, spacing: 5) {
                Text(nft.name)
                    .font(.title2)
                    .lineLimit(2)
                Text(nft.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NftListView(walletAddress: "emptystring")
    }
}
