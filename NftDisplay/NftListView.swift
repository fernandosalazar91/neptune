//
//  ContentView.swift
//  NftDisplay
//
//  Created by Work on 11/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var nfts: [Nft] = []
    
    var body: some View {
        NavigationView {
            List(nfts) { nft in
                NavigationLink(destination: NftDetailView(nft: nft), label: {
                    NftCell(nft: nft)
                })
            }
            .onAppear {
                Api().getNfts { (nfts) in
                    self.nfts = nfts
                }
            }
        }
    }
}

struct NftCell: View {
    
    var nft: Nft
    
    var body: some View {
        HStack {
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
        ContentView()
    }
}
