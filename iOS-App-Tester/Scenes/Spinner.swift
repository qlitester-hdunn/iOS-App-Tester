//
//  Spinner.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/23/21.
//

import Foundation
import SwiftUI

struct Spinner: View {
    var title: String
    var model: DBModel?
    var options: [String] = ["No Data"]
    @State var selection: Int = 0
//    @Binding var selection: Int
    
    init(title: String = ""){
        
        self.model = database

        if (model?.europeanCountries != nil){
            self.options = model!.europeanCountries
        }
        
        self.title = title
    }
    
    @State private var showOptions: Bool = false
    
    var body: some View {
        ZStack {
            // Static row which shows user's current selection
            VStack {
                Text(title)
                Spacer()
                Text(options[selection])
                    .foregroundColor(Color.black.opacity(0.6))
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
            }
            .font(Font.custom("Avenir Next", size: 16).weight(.medium))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white)
            .onTapGesture {
                // show the dropdown options
                withAnimation(Animation.spring().speed(2)) {
                    showOptions = true
                }
            }
            
            // Drop down options
            if showOptions {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(Font.custom("Avenir Next", size: 16).weight(.semibold))
                        .foregroundColor(.white)
                    VStack {
                        Spacer()
                        ForEach(options.indices, id: \.self) { i in
                            if i == selection {
                                Text(options[i])
                                    .font(.system(size: 12))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(4)
                                    .onTapGesture {
                                        // hide dropdown options - user selection didn't change
                                        withAnimation(Animation.spring().speed(2)) {
                                            showOptions = false
                                        }
                                    }
                            } else {
                                Text(options[i])
                                    .font(.system(size: 12))
                                    .onTapGesture {
                                        // update user selection and close options dropdown
                                        withAnimation(Animation.spring().speed(2)) {
                                            selection = i
                                            showOptions = false
                                        }
                                    }
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 2)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.black)
                .foregroundColor(.white)
                .transition(.opacity)
                
            }
            
        }
    }
}

//struct Spinner_Previews: PreviewProvider {
//    static var previews: some View {
//        //Spinner(title: "Spinner/Dropdowm", selection: Binding<Int>?({ Set: 0}))
//    }
//}
