//
//  CustomList.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/23/21.
//

import Foundation
import SwiftUI

struct CustomList: View {
    var body: some View {
        VStack{
            NavigationLink(destination: CustomList()){
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).padding()
            }
            
            NavigationLink(destination: self){
                CustomListBtn()
            }
            CarList()
        }
    }
}

struct CustomList_Previews: PreviewProvider {
    static var previews: some View {
        CustomList()
    }
}
