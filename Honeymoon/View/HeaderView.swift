//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Mickael PAYAN on 31/05/2023.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.showInfoView.toggle()
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button(action: {
                self.showGuideView.toggle()
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.sizeThatFits)
    }
}
