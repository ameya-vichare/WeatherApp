//
//  WeatherAPIConfig.swift
//  AppEndpoints
//
//  Created by Ameya on 07/09/25.
//

import Foundation
import AppConstants
import Networking

public enum WeatherAPIConfig: APIConfig {
    case weather(latitude: Double, longitude: Double)
    
    public func path() -> String {
        "/data/2.5/weather"
    }
    
    public func httpMethod() -> Networking.HTTPMethod {
        .GET
    }
    
    public func queryItems() -> [URLQueryItem]? {
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case .weather(let latitude, let longitude):
            queryItems.append(URLQueryItem(name: CommonQueryItemKeys.latitude.rawValue, value: String(latitude)))
            queryItems.append(URLQueryItem(name: CommonQueryItemKeys.longitude.rawValue, value: String(longitude)))
            queryItems.append(URLQueryItem(name: CommonQueryItemKeys.apiKey.rawValue, value: AppConstants.apiKey))
            queryItems.append(URLQueryItem(name: CommonQueryItemKeys.units.rawValue, value: AppConstants.weatherMetric))
        }
        
        return queryItems
    }
    
    public func httpBody() -> Data? {
        return nil
    }
    
    public func httpHeaders() -> [String: String]? {
        return nil
    }
}
