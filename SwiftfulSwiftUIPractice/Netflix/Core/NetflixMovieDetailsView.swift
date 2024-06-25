//
//  NetflixMovieDetailsView.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 16/06/24.
//

import SwiftUI

struct NetflixMovieDetailsView: View {
    
    var product: Product = .mock
    
    @State private var prgogress: Double = 0.2
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: product.firstImage,
                    progress: prgogress,
                    onAirplayPressed: {
                        
                    },
                    onXMarkPreseed: {
                        
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(spacing: 16) {
                        NetflixDetailsProductView(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2024",
                            seasonCount: 4,
                            hasClosedCaptons: true,
                            isTopTen: 6,
                            descriptionText: product.description,
                            castText: "Cast: Nick, Jhon, Your name, someone else",
                            onPlayPressed: {
                                
                            },
                            onDownloadPressed: {
                                
                            }
                        )
                    }
                }
                .scrollIndicators(.hidden)
                
            }
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
