//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Mickael PAYAN on 01/06/2023.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
