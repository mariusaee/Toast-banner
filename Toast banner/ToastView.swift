//
//  ToastView.swift
//  Toast banner
//
//  Created by Marius Malyshev on 01.12.2021.
//

import SwiftUI

struct ToastView: View {
    @State private var isShowing = false
    
    var body: some View {
        ZStack {
            Text("Hello, World!")
                .toast(isShowing: $isShowing)
                .onTapGesture {
                    isShowing.toggle()
                }
        }
    }
}

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let duration: TimeInterval
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
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
}

extension View {
    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 3) -> some View {
        modifier(ToastModifier(isShowing: isShowing, duration: duration))
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
