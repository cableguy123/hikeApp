//
//  SettingsView.swift
//  hikeApp
//
//  Created by 임석현 on R 6/05/19.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    private let alternateAppIcons :  [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    var body: some View {
        List {
            // MARK: - SECTION : HEADER
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("HIKE")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("アプリ")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ],startPoint: .top, endPoint: .bottom)
                )
                .padding(.top,8)
                
                VStack(spacing: 8) {
                    Text("パーフェクト·トラック")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("写真では華やかに見えますが、実際にそこにいるとさらに良くなります。 いつかまたやりたいと思っているハイキング。 \nアプリで最高の日のハイキングを見つける")
                        .font(.footnote)
                        .italic()
                    
                    Text("散歩の時間です。")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(.hidden)
            // MARK: - SECTION: ICONS
            Section(header: Text("アイコン")) {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack(spacing: 12){
                        ForEach(alternateAppIcons.indices,id: \.self) { item in
                            Button {
                                print("\(alternateAppIcons[item]) was pressed")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                                    error in
                                    if(error != nil) {
                                        print("Failed request to update the app's icon:  \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                } //: SCROLL VIEW
                .padding(.top, 12)
                Text("上記のコレクションからお気に入りのアプリアイコンを選択してください。")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            } //: SECTION
            .listRowSeparator(.hidden)
            // MARK: - SECTION: ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    // HStack = 수평
                    Spacer()
                    Text("Copyright All right reserved")
                    Spacer()
                }
                    .padding(.vertical,8)
            ) {
            // 1. Basic Labeled Content
//                LabeledContent("Application", value: "Hike")
                
                
            // 2. Advanced Labeled Content
                CustomListRow(rowLabel: "アプリケーション", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRow(rowLabel: "互換性", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                CustomListRow(rowLabel: "テクノロジー", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRow(rowLabel: "バージョン", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRow(rowLabel: "開発者", rowIcon: "ellipsis.curlybraces", rowContent: "IM SEOKHYEON", rowTintColor: .mint)
                CustomListRow(rowLabel: "デザイナー", rowIcon: "paintpalette", rowContent: "IM SEOKHYEON", rowTintColor: .pink)
                CustomListRow(rowLabel: "サイト", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Google", rowLinkDestination: "https://www.google.com")
                
            } //: SECTION
        } //: LIST
        
    }
}

#Preview {
    SettingsView()
}
