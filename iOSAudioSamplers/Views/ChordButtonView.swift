//
//  ChordButtonView.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import Foundation
import SwiftUI


struct ChordButton: View {
    var label: String
    var color: Color
    var onPress: () -> Void
    var onUnpress: () -> Void
    
    var body: some View {
        Button(action: {}) {
            Text(label)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 18))
                .padding()
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.black, lineWidth: 2)
                )
        }
        .background(color)
        .cornerRadius(40)
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { isPressing in
            if isPressing {
                onPress()
            } else {
                onUnpress()
            }
        }, perform: {})
    }
}
