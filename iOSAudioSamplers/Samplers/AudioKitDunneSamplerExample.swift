//
//  AudioKitDunneSamplerExample.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import Foundation
import AudioKit
import DunneAudioKit


class AudioKitDunneSamplerExample {
    private let engine = AudioEngine()
    private let sampler = Sampler()
    
    func setup() {
        setupAudioEngine()
        loadSoundFont()
    }
    
    func setupAudioEngine() {
        do {
            engine.output = sampler
            try engine.start()
        } catch {
            Log("AudioKitDunneSampler: Could not start audio engine")
        }
    }
    
    func loadSoundFont() {
        if let fileURL = Bundle.main.url(forResource: "Keyboards", withExtension: "sf2") {
            sampler.loadSFZ(url: fileURL)
        } else {
            Log("AudioKitDunneSampler: Could not find soundfont file")
        }
    }
    
    func noteOn(note: UInt8) {
        sampler.play(noteNumber: MIDINoteNumber(note), velocity: 90, channel: 0)
    }
    
    func noteOff(note: UInt8) {
        sampler.stop(noteNumber: MIDINoteNumber(note), channel: 0)
    }
}
