//
//  ToastView.swift
//  Toast banner
//
//  Created by Marius Malyshev on 01.12.2021.
//

import SwiftUI

// MARK: - ToastView
struct ToastView: View {
    @State private var isShowing = false
    
    var body: some View {
        Text("Hello, World!")
            .toast(isShowing: $isShowing)
            .onTapGesture {
                isShowing.toggle()
            }
    }
}

// MARK: - Custom Modifier
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
                            .foregroundColor(.red)
                        Text("Tim Cook liked your post")
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(radius: 5)
                }
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 1) -> some View {
        modifier(ToastModifier(isShowing: isShowing, duration: duration))
    }
}

// MARK: - Preview
struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToastView()
            ToastView()
                .previewDevice("iPhone SE (1st generation)")
        }
    }
}
