//
//  BackgroundGradient.swift
//  JSONMoviesApp
//
//  Created by Alondra García Morales on 18/06/24.
//

import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [.black, Color("Somes")]), center: .center, startRadius: 200, endRadius: 650).ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundGradient()
}
