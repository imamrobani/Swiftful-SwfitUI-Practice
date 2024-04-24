//
//  SpotifyPlaylistView.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 24/04/24.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.description,
                        imageName: product.thumbnail
                    )
                    
                    PlaylistDescriptionCell(
                        desc: product.description,
                        username: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharedtPressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
