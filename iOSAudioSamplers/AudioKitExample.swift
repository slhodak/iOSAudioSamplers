//
//  AUAudioUnitExample.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import Foundation
import AudioKit


class AudioKitSamplerExample {
    let engine = AudioEngine()
    var instrument = AppleSampler()
    
    init() {
        engine.output = instrument
        
        do {
            if let fileURL = Bundle.main.url(forResource: "Keyboards", withExtension: "sf2") {
                try instrument.loadInstrument(url: fileURL)
            } else {
                Log("AudioKitSampler: Could not find soundfont file")
            }
        } catch {
            Log("AudioKitSampler: Could not load instrument")
        }
    }
    
    func startEngine() {
        do {
            try engine.start()
        } catch {
            Log("AudioKitSampler: Could not start audio engine")
        }
    }
    
    func noteOn(note: UInt8) {
        instrument.play(noteNumber: MIDINoteNumber(note), velocity: 90, channel: 0)
    }
    
    func noteOff(note: UInt8) {
        instrument.stop(noteNumber: MIDINoteNumber(note), channel: 0)
    }
}
