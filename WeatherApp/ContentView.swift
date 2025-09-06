//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ameya on 06/09/25.
//

import SwiftUI
import Networking
import AppEndpoints
import AppModels
import Combine

struct ContentView: View {
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            Button("Geocode") {
                Task {
                    let locationEndpoint = LocationEndpoint.geocode(location: "Mumbai")
                    let networkRequest = NetworkRequest(
                        path: locationEndpoint.path(),
                        httpMethod: .GET,
                        queryItems: locationEndpoint.queryItems()
                    )
                    NetworkClient(baseURL: URL(string: "https://api.openweathermap.org")!)
                        .perform(request: networkRequest, response: [Location].self)
                        .receive(on: DispatchQueue.main)
                        .sink { error in
                            print(error)
                        } receiveValue: { location in
                            print(location)
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
