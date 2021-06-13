//
//  CarModel.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/31/21.
//

import Foundation
import SwiftUI

struct CarModel: Identifiable, Properties {
    
    var id: String? = ""
    var Name: String? = ""
    var Miles_per_Gallon: Decimal? = 0
    var Cylinders: Decimal? = 0
    var Displacement: Decimal? = 0
    var Horsepower: Decimal? = 0
    var Weight_in_lbs: Decimal? = 0
    var Acceleration: Decimal? = 0
    var Year: String? = ""
    var Origin:String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case Name = "Name"
        case Miles_per_Gallon = "Miles_per_Gallon"
        case Cylinders = "Cylinders"
        case Displacement = "Displacement"
        case Horsepower = "Horsepower"
        case Weight_in_lbs = "Weight_in_lbs"
        case Acceleration = "Acceleration"
        case Year = "Year"
        case Origin = "Origin"
        }
}
extension CarModel: Decodable, Hashable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        Name = try values.decode(String.self, forKey: .Name)
        do{
            Miles_per_Gallon = try values.decode(Decimal.self, forKey: .Miles_per_Gallon)
        } catch {
            Miles_per_Gallon = 0
        }
        Cylinders = try values.decode(Decimal.self, forKey: .Cylinders)
        Displacement = try values.decode(Decimal.self, forKey:.Displacement)
        do {
            Horsepower = try values.decode(Decimal.self, forKey: .Horsepower)
        }
        catch{
            Horsepower = 0
        }
        Weight_in_lbs = try values.decode(Decimal.self, forKey: .Weight_in_lbs)
        Acceleration = try values.decode(Decimal.self, forKey: .Acceleration)
        Year = try values.decode(String.self, forKey: .Year)
        Origin = try values.decode(String.self, forKey: .Origin)
        
        //        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        //        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
}

struct Cars: Decodable, Properties {
    var cars: [CarModel]
}

protocol Properties
{
    func allProperties() -> [String]
}

extension Properties {
    func allProperties() -> [String] {

        var result: [String] = []

        let mirror = Mirror(reflecting: self)

        // Optional check to make sure we're iterating over a struct or class
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            print("failed reflect mirror properties")
            return []
        }

        for (property,_) in mirror.children {
            guard let property = property else {
                continue
            }
            result.append(property)
         //   result[property] = value
        }

        return result
    }
}
extension View {
    func prnt(_ value: Any) -> Self {
        Swift.print(value)
        return self
    }
}
