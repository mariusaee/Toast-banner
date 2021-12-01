////
////  ContentView.swift
////  Toast banner
////
////  Created by Marius Malyshev on 30.11.2021.
////
//
//import SwiftUI
//
//struct ToastModifier: ViewModifier {
//    @Binding var isShowing: Bool
//    let duration: TimeInterval
//    
//    func body(content: Content) -> some View {
//        ZStack {
//            content
//            if isShowing {
//                VStack {
//                    Spacer()
//                    HStack {
//                        Image(systemName: "heart.fill")
//                        Text("Post saved successfully")
//                        Spacer()
//                    }
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(5)
//                    .shadow(radius: 5)
//                }
//                .padding()
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
//                        withAnimation {
//                            isShowing = false
//                        }
//                    }
//                }
//            }
//           
//        }
//    }
//}
//
//extension View {
//    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 3) -> some View {
//        modifier(ToastModifier(isShowing: isShowing, duration: duration))
//    }
//}
//
//struct ContentView: View {
//    @State private var isShowingToast = false
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//            .onTapGesture {
//                isShowingToast.toggle()
//            }
//            .toast(isShowing: $isShowingToast)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
