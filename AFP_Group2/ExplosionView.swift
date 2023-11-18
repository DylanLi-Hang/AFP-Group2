//
//  ExplosionView.swift
//  AFP_Group2
//
//  Created by Fabian Roth on 18/11/2023.
//

import Foundation

import SwiftUI
import CoreMotion

struct ExplodingView: View {
    @State private var isExploded = false
    private let explodingBits: Int = 75
    private let motionManager = CMMotionManager()

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<explodingBits, id: \.self) { _ in
                    Circle()
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                        .frame(width: 20, height: 20)
                        .foregroundColor(.indigo)
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.6), value: isExploded)
                        .padding()
                }
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.indigo)
                    .opacity(isExploded ? 0 : 1)
                    .animation(.easeInOut.speed(0.6), value: isExploded)
                    .padding()
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                withAnimation {
                                    isExploded.toggle()
                                }
                            }
                    )
                    .onAppear {
                        startMotionManager()
                    }
            }
            Spacer()
        }
        .navigationTitle("Explosion Animation")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func startMotionManager() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: .main) { (data, error) in
                if let acceleration = data?.userAcceleration {
                    if acceleration.x > 2.0 || acceleration.y > 2.0 || acceleration.z > 2.0 {
                        withAnimation {
                            isExploded.toggle()
                        }
                    }
                }
            }
        }
    }

    private func stopMotionManager() {
        motionManager.stopDeviceMotionUpdates()
    }
}

struct ExplodingView_Previews: PreviewProvider {
    static var previews: some View {
        ExplodingView()
    }
}




