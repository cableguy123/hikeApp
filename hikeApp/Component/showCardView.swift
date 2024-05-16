//
//  CardView1.swift
//  hikeApp
//
//  Created by 임석현 on R 6/05/19.
//

import Foundation
import SwiftUI

struct showCardView : View {
    // MARK: -PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet : Bool = false // new Sheet
    @State private var isActive : Bool = false
    // MARK: - FUNCTIONS
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber // CONDITIONAL
        randomNumber = Int.random(in: 1...5)
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("ハイキング")
                            .fontWeight(.black)
                            .font(.system(size: 42)) // .system return font
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        Spacer()
                        Button {
                            // ACTION:  Show a Sheet
                            randomImage()
                            isShowingSheet.toggle()
                        } label: {
                            CustomButton()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    Text("友人や家族と楽しい野外活動")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                } //: HEADER
                .padding(.horizontal,30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleVIew()
                    Image("image-\(imageNumber)")
                        .resizable() // 이미지 크기 조정
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                // MARK:  - FOOTER
                HStack {
                    Button {
                        // ACTION: Generate a Random Number
                        randomImage()
                    }label: {
                        Text("詳細")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            )
                            .shadow(
                                color: .black.opacity(0.25),
                                radius: 0.25,
                                x: 1,
                                y: 2
                            )
                    }
                    .buttonStyle(GradientButton())
                    // MARK: FOOTER2
                    Button {
                        self.isActive = true
                    }
                    label: {
                    Text("場所")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(
                            colors: [
                                .customGreenLight,
                                .customGreenMedium
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        )
                        .shadow(
                            color: .black.opacity(0.25),
                            radius: 0.25,
                            x: 1,
                            y: 2
                        )
                    }
                    .sheet(isPresented: $isActive) {
                
                    }
                .buttonStyle(GradientButton())
                }
            } //: VSTACK
        } //: CARD
        
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CustomBackgroundView()
}
