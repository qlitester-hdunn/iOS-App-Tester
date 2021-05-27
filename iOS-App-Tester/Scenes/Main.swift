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
    init() {
        let coloredAppearance = UINavigationBarAppearance()

        // overrides
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .blue
        coloredAppearance.shadowColor = .clear
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // work normally
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
            //        let appearance = UINavigationBarAppearance()
            //        appearance.configureWithOpaqueBackground()
            //        appearance.backgroundColor = .blue
            //        let attrs: [NSAttributedString.Key: Any] = [
            //            .foregroundColor: UIColor.white,
            //            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .black)
            //        ]
            //
            //        appearance.largeTitleTextAttributes = attrs
            //        UINavigationBar.appearance().standardAppearance = appearance
            //        UINavigationBar.appearance().compactAppearance = appearance
            //        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        MainButtons()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
