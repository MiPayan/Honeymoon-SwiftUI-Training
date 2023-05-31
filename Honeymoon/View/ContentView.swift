//
//  ContentView.swift
//  Honeymoon
//
//  Created by Mickael PAYAN on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide)
            
            Spacer()
            
            CardView(honeymoon: honeymoonData[1])
                .padding()
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Whishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon !"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
