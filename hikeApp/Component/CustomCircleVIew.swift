//
//  CustomCircleVIew.swift
//  hikeApp
//
//  Created by 임석현 on R 6/05/19.
//

import SwiftUI

struct CustomCircleVIew: View {
    //-- 애니메이션 킬수있는 변수
    @State private var isAnimateGradient: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                LinearGradient(
                    colors: [
                        .pink,
                        .customIndigoMedium,
                        .customSalmonLight
                    ],
                    startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                    endPoint: isAnimateGradient ? .bottomTrailing : .topLeading
                )
                )
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                        
                    }
                }
            
        MotionAnimationView()
        } // : ZSTACK
        .frame(width: 256,height: 256)
    }
}

#Preview {
    CustomCircleVIew()
}
