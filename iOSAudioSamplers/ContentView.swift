//
//  ContentView.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import SwiftUI

let CMajor: [UInt8] = [60, 64, 67]

struct ContentView: View {
    private let avAudioUnitSampler = AVAudioUnitSamplerExample()
    private let audioKitAppleSampler = AudioKitAppleSamplerExample()
    private let audioKitDunneSampler = AudioKitDunneSamplerExample()
    
    init() {
        avAudioUnitSampler.setup()
        audioKitAppleSampler.setup()
        audioKitDunneSampler.setup()
    }
    
    var body: some View {
        VStack {
            ChordButton(
                label: "C Major - AVAudioUnit",
                color: .orange,
                onPress: {
                    for note in CMajor {
                        avAudioUnitSampler.noteOn(note: note)
                    }
                },
                onUnpress: {
                    for note in CMajor {
                        avAudioUnitSampler.noteOff(note: note)
                    }
                })
            
            ChordButton(
                label: "C Major - AudioKitAppleSampler",
                color: .cyan,
                onPress: {
                    for note in CMajor {
                        audioKitAppleSampler.noteOn(note: note)
                    }
                },
                onUnpress: {
                    for note in CMajor {
                        audioKitAppleSampler.noteOff(note: note)
                    }
                })
            
            ChordButton(
                label: "C Major - AudioKitDunneSampler",
                color: .yellow,
                onPress: {
                    for note in CMajor {
                        audioKitDunneSampler.noteOn(note: note)
                    }
                },
                onUnpress: {
                    for note in CMajor {
                        audioKitDunneSampler.noteOff(note: note)
                    }
                })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


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
