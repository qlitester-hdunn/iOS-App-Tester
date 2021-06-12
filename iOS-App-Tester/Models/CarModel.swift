//
//  CarModel.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/31/21.
//

import Foundation

struct CarModel: Codable{

    var Id: String
    var Name: String
    var Miles_per_Gallon: Float
    var Cylinders: Int
    var Displacement: Int
    var Horsepower: Int
    var Weight_in_lbs: Int
    var Acceleration: Int
    var Year: String
    var Origin:String
}
struct Cars: Codable{
    var cars: [CarModel]
}
