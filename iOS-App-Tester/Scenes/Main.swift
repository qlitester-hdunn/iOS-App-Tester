//
//  Main.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/16/21.
//

import SwiftUI

struct Main: View {
    let asset = NSDataAsset(name: "Persons", bundle: Bundle.main)
    //    let json = try? NSJSONSerialization.JSONObjectWithData(asset!.data, options: NSJSONReadingOptions.AllowFragments)
    //    print(json)
   
    var body: some View {
        MainButtons()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
