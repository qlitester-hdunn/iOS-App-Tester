//
//  TypeText.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/17/21.
//

import SwiftUI

struct TypeText: View {
    @Environment(\.presentationMode) var presentation
    @State var text = /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("Type Text")
            Spacer()
            TextEditor(text: $text)
                .padding(4)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItemGroup(placement: .navigation) {
//                        Button(action: {
//                                self.presentation.wrappedValue.dismiss()
//                                }) {
//                                    HStack {
//                                    Image("back") // BackButton Image
//                                        .aspectRatio(contentMode: .fit)
//                                        .foregroundColor(.white)
//                                    Text("Go Back") //translated Back button title
//                                    }
//                                }
//
//                    }
                        
                        HStack{
                        Image(systemName: "arrow.left")
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .foregroundColor(.white)
                            .onTapGesture {
                                // code to dismiss the view
                                self.presentation.wrappedValue.dismiss()
                            }

                            Text("iOS-App-Tester").foregroundColor(.white).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }

                    }
                }
        }
    }
}

struct TypeText_Previews: PreviewProvider {
    static var previews: some View {
        TypeText()
    }
}
