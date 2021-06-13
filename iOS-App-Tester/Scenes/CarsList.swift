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
    var body: some View {
        Text("Drive this \(row.Name!)")
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
            Text("not implemented")
                List {
                    ForEach( Array(self.cars!.allProperties()), id: \.self) { (key) in
                        HStack {
                            Text(key)
                            Spacer()
                            ForEach(self.cars!.cars, id: \.self){ car in
                                Text(String(describing: "\(car)"))
//                            Text(self.dict[key]?.description ?? "false").onTapGesture {
//                                let v = self.dict[key] ?? false
//                                self.dict[key] = !v
//                            }.foregroundColor(self.dict[key] ?? false ? Color.red: Color.green)
                        
                            }
                        }
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
