//
//  CustomButton.swift
//  ticktock
//
//  Created by Angel alberto Bernechea on 3/9/24.
//

import SwiftUI
import UIKit

struct CustomButton: View {
    @State var title:String?
    
    var body: some View {
        Button {
            print("hola")
        } label: {
            if let mjs = title {
                Text(mjs)
                    .padding(.all, 16.0)
                    .background(Color(red: 4.3, green:0.4, blue: 4.5))
                    .border(Color.black,width: 6)
                    .cornerRadius(19)
                    .foregroundColor(.black)
                    
                    
            }
           
        }

    }
}

#Preview {
    CustomButton(title: "SoyButton")
}
func crateRandomeColor()->UIColor{
    let randomeColor = UIColor(red: CGFloat.random(in: 0...1),
                               green: CGFloat.random(in: 0...1),
                               blue: CGFloat.random(in: 0...1),
                               alpha: 1)
    return randomeColor
}
