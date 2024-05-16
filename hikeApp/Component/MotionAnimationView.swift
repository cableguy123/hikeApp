//
//  MotionAnimationView.swift
//  hikeApp
//
//  Created by 임석현 on R 6/05/19.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimatiing : Bool = false
    // MARK: - FUNCTIONS
    // 1. 랜덤 함수
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // 2. 랜덤 사이즈
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    // 3. 랜덤 scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. 랜덤 스피드
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimatiing ? randomScale() : 1)
                    .onAppear(
                        perform: {
                            withAnimation(
                                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            ) {
                                isAnimatiing = true
                            }
                        }
                    )
            }
        } //--ZSTACK
        .frame(width: 256,height: 256)
        .mask(Circle())
        .drawingGroup()
        
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
    
}
