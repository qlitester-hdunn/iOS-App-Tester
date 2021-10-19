//
//  Main.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/16/21.
//

import SwiftUI

struct Main: View {
    
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
