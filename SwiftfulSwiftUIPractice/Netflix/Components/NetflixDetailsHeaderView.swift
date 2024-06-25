//
//  NetflixDetailsHeaderView.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 16/06/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsHeaderView: View {
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirplayPressed: (() -> Void)? = nil
    var onXMarkPreseed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
                .clipped()
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixDarkGray,
                foregroundColor: .netflixDarkRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
            HStack(spacing: 8) {
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay(
                        Image(systemName: "tv.badge.wifi")
                            .offset(y: 1)
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onAirplayPressed?()
                    }
                
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay(
                        Image(systemName: "xmark")
                            .offset(y: 1)
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onXMarkPreseed?()
                    }
            }
            .foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    NetflixDetailsHeaderView()
}
