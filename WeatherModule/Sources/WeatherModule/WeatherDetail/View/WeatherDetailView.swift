//
//  SwiftUIView.swift
//  WeatherModule
//
//  Created by Ameya on 07/09/25.
//

import SwiftUI

struct WeatherDetailView: View {
    @State private var city: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter city", text: $city)
                .textFieldStyle(.plain)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .onSubmit {
                    city = ""
                }
            
            Spacer()
            
            Text("Weather ")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

#Preview {
    WeatherDetailView()
}
