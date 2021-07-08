//
//  CarsList.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/31/21.
//

import Foundation
import SwiftUI

struct CarListRow: View {
    var row: CarModel
    init(model: CarModel){
        self.row = model
    }
    var body: some View {
        HStack {
            Text("Drive a \(row.Name!.capitalized) ")
            Spacer()
            Text("with \(String(describing:row.Horsepower!)) HP!")
        }
    }
}

struct CarList: View {
    let cars = CarListAdapter().cars
    
    func pnt() -> [String]{
        let props: [String]? = cars!.allProperties()
        print("keys \(props!)")
        return props!
    }
    
    var body: some View {
        VStack {
            Text("implemented")
            List {
                ForEach(self.cars!.cars, id: \.self){ car in
                    CarListRow(model: car)
                }
            }
        }
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        CarList()
    }
}
