//
//  SiriAnimation.swift
//  app
//
//  Created by Reya Vir on 6/22/24.
//

import SwiftUI

struct SiriAnimation: View {
    @State var isRotating = false
    
    var body: some View {
        ZStack {
            ZStack {
                Image("shadow")
                Image("icon-bg")
                Image("pink-top")
                //                    .rotationEffect(.degrees(isRotating ? 320 : -360))
                //                    .hueRotation(.degrees(isRotating ? -270 : 60))
                
                Image("pink-left")
                    .rotationEffect(.degrees(isRotating ? -360 : 180))
                    .hueRotation(.degrees(isRotating ? -220 : 300))
                //
                Image("blue-middle")
                    .rotationEffect(.degrees(isRotating ? -360 : 420))
                    .hueRotation(.degrees(isRotating ? -150 : 0))
                    .rotation3DEffect(.degrees(75), axis: (x: isRotating ? 1 : 5, y: 0, z: 0))
                //
                Image("blue-right")
                    .rotationEffect(.degrees(isRotating ? -360 : 420))
                    .hueRotation(.degrees(isRotating ? 720 : -50))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: isRotating ? -5 : 15))
                
                //                Image("intersect")
                //                    .rotationEffect(.degrees(isRotating ? 30 : -420))
                //                    .hueRotation(.degrees(isRotating ? 0 : 720))
                //                    .rotation3DEffect(.degrees(15), axis: (x: 1, y: 1, z: 1), perspective: isRotating ? 5 : -5)
                //
                                Image("green-right")
                                    .rotationEffect(.degrees(isRotating ? -300 : 360))
                                    .hueRotation(.degrees(isRotating ? 300 : -15))
                                    .rotation3DEffect(.degrees(15), axis: (x: 1, y: isRotating ? -1 : 1, z: 0), perspective: isRotating ? -1 : 1)
                //
                //                Image("green-left")
                //                    .rotationEffect(.degrees(isRotating ? 360 : -360))
                //                    .hueRotation(.degrees(isRotating ? 180 :50))
                //                    .rotation3DEffect(.degrees(75), axis: (x: 1, y:isRotating ? -5 : 15, z: 0))
                //
                //
                //                Image("bottom-pink")
                //                    .rotationEffect(.degrees(isRotating ? 400 : -360))
                //                    .hueRotation(.degrees(isRotating ? 0 : 230))
                //                    .opacity(0.25)
                //                    .blendMode(.multiply)
                //                    .rotation3DEffect(.degrees(75), axis: (x: 5, y:isRotating ? 1 : -45, z: 0))
            }
            //            .blendMode(isRotating ? .hardLight : .difference )
            //
            Image("highlight")
                .rotationEffect(.degrees(isRotating ? 360 : 250))
                .hueRotation(.degrees(isRotating ? 0 : 230))
                .padding()
                .onAppear{
                    withAnimation(.easeInOut(duration: 12).repeatForever(autoreverses: false)) {
                        isRotating.toggle()
                    }
                }
        }
        .scaleEffect(0.5)
        
        Button(action: {
            withAnimation(.easeInOut(duration: 12).repeatForever(autoreverses: false)) {
                self.isRotating.toggle()
            }
        }) {
            Text("Start Animation")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

#Preview {
    SiriAnimation()
}
