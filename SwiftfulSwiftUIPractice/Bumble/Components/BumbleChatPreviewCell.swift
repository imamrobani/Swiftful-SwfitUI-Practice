//
//  BumbleChatPreviewCell.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 06/05/24.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var haseNewMessage: Bool = true
    var userName: String = "John"
    var lastChatMessage: String? = "this is last message. dgsahjdg agdjhag dahgdh agdjagd jasgd jhsagda h"
    var isYourMove: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(
                imageName: imageName,
                percentageRemaining: percentageRemaining,
                hasNewMessage: haseNewMessage
            )
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text(userName)
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if isYourMove {
                        Text("Your Move")
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .background(.bumbleYellow)
                            .clipShape(.rect(cornerRadius: 32))
                    }
                }
                
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    VStack {
        BumbleChatPreviewCell()
        BumbleChatPreviewCell()
        BumbleChatPreviewCell()
    }
    .padding()
}
