//
//  SwiftUIView.swift
//  WeatherModule
//
//  Created by Ameya on 07/09/25.
//

import SwiftUI
import AppConstants
import Networking

public struct WeatherDetailView: View {
    @ObservedObject private var weatherDetailViewModel = WeatherDetailViewModel(
        networkClient: NetworkClient(
            baseURL: URL(
                string: AppConstants.baseURL
            )!
        )
    )
    
    public var body: some View {
        VStack {
            TextField("Enter city", text: $weatherDetailViewModel.city)
                .textFieldStyle(.plain)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .onSubmit {
                    weatherDetailViewModel.makeInitialAPICall()
                    weatherDetailViewModel.city = ""
                }
            
            Spacer()
            
            Text("\(weatherDetailViewModel.weather?.temp ?? 0)")
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
