//
//  BumbleFilterView.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 24/04/24.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options: [String] = ["Everyone", "Trending"]
    @Binding var selected: String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack(spacing: 8) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selected == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selected", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selected == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selected = option
                }
            }
        }
        .animation(.smooth, value: selected)
    }
}

fileprivate struct BumbleFilterViewPreview: View {
    
    var options: [String] = ["Everyone", "Trending", "Hello"]
    @State private var selected = "Hello"
    
    var body: some View {
        BumbleFilterView(options: options, selected: $selected)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
}
