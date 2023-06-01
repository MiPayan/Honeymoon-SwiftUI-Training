//
//  InfoView.swift
//  Honeymoon
//
//  Created by Mickael PAYAN on 01/06/2023.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20 ) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer(minLength: 10)
                
                Button(action: {
                    self.dismiss()
                }) {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
            RowAppView(itemOne: "Developer", itemTwo: "Mickaël Payan")
            RowAppView(itemOne: "Designer", itemTwo: "Robert Petras")
            RowAppView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
            RowAppView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
}

struct RowAppView: View {
    
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        HStack {
            Text(itemOne)
                .foregroundColor(.gray)
            Spacer()
            Text(itemTwo)
        }
        Divider()
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Photos")
                    .foregroundColor(.gray)
                Spacer()
                Text("Unsplash")
            }
            
            Divider()
            
            Text("Photographers")
                .foregroundColor(.gray)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}
