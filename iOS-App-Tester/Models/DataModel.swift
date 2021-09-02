//
//  DBModel.swift
//  iOS-App-Tester
//
//  Created by Tester on 7/9/21.
//

import Foundation

protocol DBModel: Decodable {
    var newbooks: [Book] {get set}
    var allbooks: [Book] {get set}
    var cities: [String]   {get set}
    var europeanCountries: [String] {get set}
}

struct DataModel: DBModel, Decodable {
    var newbooks: [Book]
    var allbooks: [Book]
    var cities: [String]
    var europeanCountries: [String]
    
    enum CodingKeys: String, CodingKey {
        case newbooks = "newbooks"
        case allbooks = "allbooks"
        case cities = "cities"
        case europeanCountries = "european_countries"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        newbooks = try values.decode([Book].self, forKey: .newbooks)
        allbooks = try values.decode([Book].self, forKey: .allbooks)
        cities = try values.decode([String].self, forKey: .cities)
        europeanCountries = try values.decode([String].self, forKey: .europeanCountries)
    }
}

struct Book: Decodable, Identifiable {
    var id: Int = 0
    var title: String = ""
    var author: String = ""
}
struct DataDefault: DBModel, Decodable {
    var newbooks: [Book] = [Book()]
    var allbooks: [Book] = [Book()]
    var cities: [String] = [""]
    var europeanCountries: [String] = [""]
}
