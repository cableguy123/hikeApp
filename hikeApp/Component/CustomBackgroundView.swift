//
//  CustomBackgroundView.swift
//  hikeApp
//
//  Created by 임석현 on R 6/05/19.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.customGreenDark
                .cornerRadius(40)
            .offset(y: 12)
        }
        Color.customGreenLight
            .cornerRadius(40)
            .offset(y: 3)
            .opacity(0.85)
        LinearGradient(
            colors: [
                .customGreenLight,
                .customGreenMedium
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .cornerRadius(40)
    }
}

#Preview {
    CustomBackgroundView()
}
