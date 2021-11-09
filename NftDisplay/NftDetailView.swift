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
            Image(nft.image_url)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(12)
            
            Text(nft.name)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Text(nft.description)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
    }
}

struct NftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NftDetailView(nft: Nft)
    }
}
