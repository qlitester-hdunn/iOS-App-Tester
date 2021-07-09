//
//  TypeText.swift
//  iOS-App-Tester
//
//  Created by Tester on 5/17/21.
//

import SwiftUI

struct TypeText: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var store: Store
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        
        VStack(alignment: .center){
            Text("Type Text")
                .padding(.bottom, 10)
            
            TextEditor(text: Binding<String>(
                        get: { store.state.editText },
                        set: { store.dispatch(action: .setTextEdit($0))})
            )
            .padding(4)
            .frame(maxWidth: 200, maxHeight:100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(UIColor(red: 0.95, green: 0.95, blue: 1.0, alpha: 1.0)))
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .navigation) {
                    
                    HStack{
                        Image(systemName: "arrow.left")
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .foregroundColor(.white)
                            .onTapGesture {
                                // code to dismiss the view
                                self.presentation.wrappedValue.dismiss()
                            }
                        
                        Text("iOS-App-Tester").foregroundColor(.white).font(.title).fontWeight(.medium)
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
