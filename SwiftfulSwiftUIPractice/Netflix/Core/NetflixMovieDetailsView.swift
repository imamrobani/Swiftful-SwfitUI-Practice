//
//  NetflixMovieDetailsView.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 16/06/24.
//

import SwiftUI
import SwiftfulRouting

struct NetflixMovieDetailsView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    
    @State private var prgogress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    
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
                        router.dismissScreen()
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        detailsProductSection
                        buttonSection
                        productsGridSection
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        
        do {
            products =  try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
    private func onProductPressed(product: Product) {
        router.showScreen(.sheet) { _ in
            NetflixMovieDetailsView(product: product)
        }
    }
    
    private var detailsProductSection: some View {
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
    
    private var buttonSection: some View {
        HStack(spacing: 32) {
            MyListButton(isMyList: isMyList) {
                isMyList.toggle()
            }
            
            RateButton { selection in
                // do something with selection
            }
            
            ShareButton()
        }
        .padding(.leading, 32)
    }
    
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More like this")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible() ,spacing: 8), count: 3),
                      alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                      spacing: 8,
                      pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/,
                      content: {
                ForEach(products) { product in
                    NetflixMovieCell(
                        imageName: product.firstImage,
                        title: product.title,
                        isRecentlyAdded: product.recentlyAdded,
                        topTenRanking: nil
                    )
                    .onTapGesture {
                        onProductPressed(product: product)
                    }
                }
            })
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    RouterView { _ in
        NetflixMovieDetailsView()
    }
}
