//
//  WeatherDetailViewModel.swift
//  WeatherModule
//
//  Created by Ameya on 07/09/25.
//

import Combine
import AppModels
import AppEndpoints
import Networking
import Foundation

public class WeatherDetailViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var weather: String = ""
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
}

extension WeatherDetailViewModel {
    func getGeocodeInfo() {
        let locationAPIConfig = LocationAPIConfig.geocode(location: city)
        let locationNetworkRequest = NetworkRequest(apiConfig: locationAPIConfig)
        networkClient
            .perform(request: locationNetworkRequest, response: [Location].self)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { locations in
                print(locations)
            }

    }
}
