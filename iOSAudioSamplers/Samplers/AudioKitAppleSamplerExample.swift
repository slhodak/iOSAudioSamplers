//
//  AUAudioUnitExample.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import Foundation
import AudioKit


class AudioKitAppleSamplerExample {
    private let engine = AudioEngine()
    private let sampler = AppleSampler()
    
    func setup() {
        setupAudioEngine()
        loadSoundFont()
    }
    
    func setupAudioEngine() {
        do {
            engine.output = sampler
            try engine.start()
        } catch {
            Log("AudioKitAppleSampler: Could not start audio engine")
        }
    }
    
    func loadSoundFont() {
        do {
            if let fileURL = Bundle.main.url(forResource: "Keyboards", withExtension: "sf2") {
                try sampler.loadInstrument(url: fileURL)
            } else {
                Log("AudioKitAppleSampler: Could not find soundfont file")
            }
        } catch {
            Log("AudioKitAppleSampler: Could not load instrument")
        }
    }
    
    func noteOn(note: UInt8) {
        sampler.play(noteNumber: MIDINoteNumber(note), velocity: 90, channel: 0)
    }
    
    func noteOff(note: UInt8) {
        sampler.stop(noteNumber: MIDINoteNumber(note), channel: 0)
    }
}
