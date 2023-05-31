//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Mickael PAYAN on 31/05/2023.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showGuideView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                print("Information")
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            
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
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuide)
            .previewLayout(.sizeThatFits)
    }
}
