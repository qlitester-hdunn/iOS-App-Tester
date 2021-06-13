//
//  CarDataListAdapter.swift
//  iOS-App-Tester
//
//  Created by Tester on 6/12/21.
//

import Foundation
import SwiftUI

struct CarListAdapter {
    let asset = NSDataAsset(name: "CarData", bundle: Bundle.main)
    let decoder = JSONDecoder()
    var data: NSDictionary? = nil
    var cars: Cars? = nil
    
    init () {
        
        do{
            data = try
                JSONSerialization
                .jsonObject(with: asset!.data, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
            print("data \(String(describing: data))")
        }
        catch {
            print("error")
        }
        
        //let array = data!["cars"] as? [[String : AnyObject]]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: data!, options: JSONSerialization.WritingOptions.fragmentsAllowed)
//        let jsonString: String = String(data: jsonData, encoding: String.Encoding.utf8)!
//        print(jsonString)
        
        //        let json = try! JSONSerialization.data(withJSONObject: jsonData, options: JSONSerialization.WritingOptions.fragmentsAllowed)
        do {
            cars = try decoder.decode(Cars.self, from: jsonData)
            print(cars)
        }
        catch{
            print("DataError")
            print(error)
            
        }
    }
}
