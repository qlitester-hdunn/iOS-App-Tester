//
//  CarsList.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/31/21.
//

import Foundation
import SwiftUI

struct CarList: View {
    let asset = NSDataAsset(name: "CarData", bundle: Bundle.main)
    let decoder = JSONDecoder()
    var data: NSDictionary
    var cars: CarModel? = nil
    
    init () {
        data = try! JSONSerialization
            .jsonObject(with: asset!.data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        
        let jsonData = try! JSONSerialization.data(withJSONObject: data, options: [])
        guard let cars = try? decoder.decode(CarModel.self, from: jsonData) else {
            print("DataError")
            return
        }
        print(cars)
    }
    
    var body: some View {
        Text("Cars List Comming")
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        CarList()
    }
}
