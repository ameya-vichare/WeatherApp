//
//  Weather.swift
//  AppModels
//
//  Created by Ameya on 07/09/25.
//

public struct Weather: Decodable {
    let temp: Double?
    let feelsLike: Double?
    let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case main
    }
    
    enum InnerCodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case humidity
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let mainContainer = try container.nestedContainer(keyedBy: InnerCodingKeys.self, forKey: .main)
        
        self.temp = try mainContainer.decode(Double.self, forKey: .temp)
        self.feelsLike = try mainContainer.decode(Double.self, forKey: .feelsLike)
        self.humidity = try mainContainer.decode(Int.self, forKey: .humidity)
    }
}
