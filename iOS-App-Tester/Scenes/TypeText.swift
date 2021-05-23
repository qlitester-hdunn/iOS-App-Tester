//
//  TypeText.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/17/21.
//

import SwiftUI

struct TypeText: View {
    var body: some View {
        VStack{
            NavigationLink(destination: TypeText()){
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).padding()
            }
            
            NavigationLink(destination: self){
                TypeTextBtn()
            }
        }
    }
}

struct TypeText_Previews: PreviewProvider {
    static var previews: some View {
        TypeText()
    }
}
