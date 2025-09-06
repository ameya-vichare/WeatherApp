//
//  LocationEndpoint.swift
//  AppEndpoints
//
//  Created by Ameya on 06/09/25.
//

import Foundation
import AppConstants

public enum LocationEndpoint: Endpoint {
    case geocode(location: String)
    
    public func path() -> String {
        switch self {
        case .geocode(_):
            "/geo/1.0/direct"
        }
    }
    
    public func queryItems() -> [URLQueryItem]? {
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case let .geocode(location):
            queryItems.append(URLQueryItem(name: CommonQueryItemKeys.query.rawValue, value: location))
        }
        
        queryItems.append(URLQueryItem(name: CommonQueryItemKeys.apiKey.rawValue, value: AppConstants.apiKey))
        
        return queryItems
    }
}
