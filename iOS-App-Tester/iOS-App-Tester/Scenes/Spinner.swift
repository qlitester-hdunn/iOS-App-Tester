//
//  Spinner.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/23/21.
//

import Foundation
import SwiftUI

struct Spinner: View {
    var body: some View {
        ButtonFactory.spinner
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner()
    }
}
