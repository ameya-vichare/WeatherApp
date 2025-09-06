//
//  Location.swift
//  AppModels
//
//  Created by Ameya on 06/09/25.
//

public struct Location: Decodable {
    public let name: String?
    public let latitude: Double?
    public let longitude: Double?
    
    public enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "lon"
    }
}
