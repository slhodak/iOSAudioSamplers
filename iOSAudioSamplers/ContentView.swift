//
//  ContentView.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import SwiftUI

let CMajor: [UInt8] = [60, 64, 67]

struct ContentView: View {
    private let audioKitSampler = AudioKitSamplerExample()
    
    init() {
        audioKitSampler.startEngine()
    }
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("C Major")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 2)
                    )
            }
            .background(.cyan)
            .cornerRadius(40)
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { isPressing in
                        if isPressing {
                            for note in CMajor {
                                audioKitSampler.noteOn(note: note)
                            }
                        } else {
                            for note in CMajor {
                                audioKitSampler.noteOff(note: note)
                            }
                        }
                    }, perform: {})
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
