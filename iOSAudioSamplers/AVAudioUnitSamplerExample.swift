//
//  AVAudioUnitSamplerExample.swift
//  iOSAudioSamplers
//
//  Created by Sam Hodak on 1/11/24.
//

import Foundation
import AVFoundation


class AVAudioUnitSamplerExample {
    private let engine = AVAudioEngine()
    private let sampler = AVAudioUnitSampler()

    func setup() {
        setupAudioEngine()
        setupAudioSession()
        loadSoundFont()
    }
    
    func setupAudioEngine() {
        engine.attach(sampler)
        let mixer = engine.mainMixerNode
        engine.connect(sampler, to: mixer, format: nil)
        
        do {
            try engine.start()
        } catch {
            print("AVAudioUnitSampler: Failed to start engine: \(error)")
        }
    }
    
    func setupAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("AVAudioUnitSampler: Failed to set up audio session: \(error)")
        }
    }
    
    func loadSoundFont() {
        guard let soundfontURL = Bundle.main.url(forResource: "Keyboards", withExtension: "sf2") else {
            print("AVAudioUnitSampler: Could not load soundfont file")
            return
        }
        
        do {
            try sampler.loadSoundBankInstrument(
                at: soundfontURL,
                program: 0,
                bankMSB: UInt8(kAUSampler_DefaultMelodicBankMSB),
                bankLSB: UInt8(kAUSampler_DefaultBankLSB)
            )
        } catch {
            print("AVAudioUnitSampler: Failed to load soundfont: \(error)")
        }
    }

    func noteOn(note: UInt8) {
        sampler.startNote(note, withVelocity: 90, onChannel: 0)
    }

    func noteOff(note: UInt8) {
        sampler.stopNote(note, onChannel: 0)
    }
}
