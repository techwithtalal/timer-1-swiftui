//
//  TimerView.swift
//  Timer
//
//  Created by Tech With Talal on 1/20/25.
//

import SwiftUI

struct TimerView: View {

    @State private var timeRemaining = 15
    private let totalTime = 15

    var body: some View {
        ZStack {

            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 8)

            Circle()
                .trim(from: 0, to: CGFloat(timeRemaining) / CGFloat(totalTime))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: 1), value: timeRemaining)

            Text(timeString(from: timeRemaining))
                .font(.largeTitle)
                .padding()
        }
        .frame(width: 200)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if (timeRemaining > 0) {
                    timeRemaining -= 1
                } else {
                    timer.invalidate()
                }
            }
        }
    }

    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView()
}
