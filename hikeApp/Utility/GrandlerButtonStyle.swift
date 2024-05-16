//
//  GrandlerButtonStyle.swift
//  hikeApp
//
//  Created by 임석현 on R 6/05/19.
//

import Foundation
import SwiftUI
// CustomButton for
struct GradientButton : ButtonStyle {
    // MARK: ButtonStyleConfiguration == Configuration
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                configuration.isPressed ? 
                LinearGradient(
                    colors: [
                        .customGrayMedium,
                        .customGrayLight
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                    )
                :
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                    )
                )
                .cornerRadius(40)
    }
}
