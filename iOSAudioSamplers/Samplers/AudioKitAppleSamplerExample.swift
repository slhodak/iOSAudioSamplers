//
//  AUAudioUnitExample.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import Foundation
import AudioKit


class AudioKitAppleSamplerExample {
    let engine = AudioEngine()
    var instrument = AppleSampler()
    
    func setup() {
        setupAudioEngine()
        loadSoundFont()
    }
    
    func setupAudioEngine() {
        do {
            engine.output = instrument
            try engine.start()
        } catch {
            Log("AudioKitAppleSampler: Could not start audio engine")
        }
    }
    
    func loadSoundFont() {
        do {
            if let fileURL = Bundle.main.url(forResource: "Keyboards", withExtension: "sf2") {
                try instrument.loadInstrument(url: fileURL)
            } else {
                Log("AudioKitAppleSampler: Could not find soundfont file")
            }
        } catch {
            Log("AudioKitAppleSampler: Could not load instrument")
        }
    }
    
    func noteOn(note: UInt8) {
        instrument.play(noteNumber: MIDINoteNumber(note), velocity: 90, channel: 0)
    }
    
    func noteOff(note: UInt8) {
        instrument.stop(noteNumber: MIDINoteNumber(note), channel: 0)
    }
}
