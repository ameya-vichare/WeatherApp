//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ameya on 06/09/25.
//

import SwiftUI
import WeatherModule

struct ContentView: View {
    @State private var city: String = ""
    
    var body: some View {
        WeatherDetailView()
    }
}

#Preview {
    ContentView()
}
