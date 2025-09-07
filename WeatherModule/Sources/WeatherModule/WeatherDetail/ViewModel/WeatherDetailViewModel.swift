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
    @Published var weather: Weather?
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
}

extension WeatherDetailViewModel {
    func makeInitialAPICall() {
        getGeocodeInfo()
    }
    
    private func getGeocodeInfo() {
        let locationAPIConfig = LocationAPIConfig.geocode(location: city)
        let locationNetworkRequest = NetworkRequest(apiConfig: locationAPIConfig)
        networkClient
            .perform(request: locationNetworkRequest, response: [Location].self)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] locations in
                guard let location = locations.first else {
                    return
                }
                self?.getWeatherInfo(location: location)
            }
    }
    
    private func getWeatherInfo(location: Location) {
        guard let latitude = location.latitude,
              let longitude = location.longitude else {
            return
        }
        
        let weatherAPIConfig = WeatherAPIConfig.weather(latitude: latitude, longitude: longitude)
        let weatherNetworkRequest = NetworkRequest(apiConfig: weatherAPIConfig)
        
        networkClient
            .perform(request: weatherNetworkRequest, response: Weather.self)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] weather in
                self?.weather = weather
            }
    }
}
