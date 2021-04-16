//
//  LoadingView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 30/12/2020.
//

import SwiftUI

struct LoadingView: View {
    
    let rotationTime: Double = 0.75
        let animationTime: Double = 1.9 // Sum of all animation times
        let fullRotation: Angle = .degrees(360)
        static let initialDegree: Angle = .degrees(270)

        @State var spinnerStart: CGFloat = 0.0
        @State var spinnerEndS1: CGFloat = 0.03
        @State var spinnerEndS2S3: CGFloat = 0.03

        @State var rotationDegreeS1 = initialDegree
        @State var rotationDegreeS2 = initialDegree
        @State var rotationDegreeS3 = initialDegree

        var body: some View {
            ZStack {
                ZStack {
                    // S3
                    SpinnerCircleLoadingView(start: spinnerStart, end: spinnerEndS2S3, rotation: rotationDegreeS3, color: Color.bdePink)

                    // S2
                    SpinnerCircleLoadingView(start: spinnerStart, end: spinnerEndS2S3, rotation: rotationDegreeS2, color: Color.bdeYellow)

                    // S1
                    SpinnerCircleLoadingView(start: spinnerStart, end: spinnerEndS1, rotation: rotationDegreeS1, color: Color.bdeGreen)

                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: animationTime, repeats: true) { _ in
                    self.animateSpinner()
                }
            }
        }

        // MARK: Animation methods
        func animateSpinner(with duration: Double, completion: @escaping (() -> Void)) {
            Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
                withAnimation(Animation.easeInOut(duration: self.rotationTime)) {
                    completion()
                }
            }
        }

        func animateSpinner() {
            animateSpinner(with: rotationTime) { self.spinnerEndS1 = 1.0 }

            animateSpinner(with: (rotationTime * 2) - 0.025) {
                self.rotationDegreeS1 += fullRotation
                self.spinnerEndS2S3 = 0.8
            }

            animateSpinner(with: (rotationTime * 2)) {
                self.spinnerEndS1 = 0.03
                self.spinnerEndS2S3 = 0.03
            }

            animateSpinner(with: (rotationTime * 2) + 0.0525) { self.rotationDegreeS2 += fullRotation }

            animateSpinner(with: (rotationTime * 2) + 0.225) { self.rotationDegreeS3 += fullRotation }
        }
    }


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

struct SpinnerCircleLoadingView: View {
    var start: CGFloat
    var end: CGFloat
    var rotation: Angle
    var color: Color
    
    var body: some View {
        Circle()
            .trim(from: start, to: end)
            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
            .fill(color)
            .rotationEffect(rotation)
    }
}
