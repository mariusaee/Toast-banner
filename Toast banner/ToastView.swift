//
//  ToastView.swift
//  Toast banner
//
//  Created by Marius Malyshev on 01.12.2021.
//

import SwiftUI

struct ToastView: View {
    var body: some View {
        ZStack {
            Text("Hello, World!")
            
        }
    }
}

struct ToastModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Tim Cook liked your post")
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .shadow(radius: 5)
            }
            .padding()
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToastView()
            ToastView()
                .previewDevice("iPhone SE (1st generation)")
        }
    }
}
