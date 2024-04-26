//
//  InterestPillGridView.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 26/04/24.
//

import SwiftUI
import SwiftfulUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct InterestPillGridView: View {
    
    var interests: [UserInterest] = User.mock.interests
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest {
                    InterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        InterestPillGridView(interests: User.mock.interests)
        InterestPillGridView(interests: User.mock.basics)
    }
}
