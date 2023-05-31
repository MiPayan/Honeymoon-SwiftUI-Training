//
//  FooterView.swift
//  Honeymoon
//
//  Created by Mickael PAYAN on 31/05/2023.
//

import SwiftUI

struct FooterView: View {
    
    @Binding var showBookingAlert: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button(action: {
                self.showBookingAlert.toggle()
            }) {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(.pink)
                    .background(
                        Capsule().stroke(.pink, lineWidth: 2)
                    )
            }
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showalert: Bool = false
    
    static var previews: some View {
        FooterView(showBookingAlert: $showalert)
            .previewLayout(.sizeThatFits)
    }
}
