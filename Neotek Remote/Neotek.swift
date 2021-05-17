//
//  Neotek.swift
//  Neotek Remote
//
//  Created by Daniel Hooper on 2021-05-01.
//

import WebMIDIKit

/// All the MIDI
struct Neotek {
    
    private let midi = MIDIAccess()

    private func noteForChannel(_ channel: Int) -> UInt8 {
        let value: UInt8
        switch channel {
        case 1:
            value = 0x24
        case 2:
            value = 0x25
        case 3:
            value = 0x26
        case 4:
            value = 0x27
        case 5:
            value = 0x28
        case 6:
            value = 0x29
        case 7:
            value = 0x2A
        case 8:
            value = 0x2B
        default:
            value = 0
        }
        return value
    }
    
    /// Sends the MIDI message to mute/unmute a channel. isMuting = false when unmuting a channel
    func muteChannel(_ channel: Int, isMuting: Bool) {
        let firstOutput = midi.outputs.first?.1

        firstOutput.map {
            let velocity: UInt8 = isMuting ? 1 : 0x7f
            let note = noteForChannel(channel)
            let noteOn: [UInt8] = [0x90, note, velocity]
            let noteOff: [UInt8] = [0x80, note, 0]
            $0.send(noteOn)
              .send(noteOff, offset: 100) // .1 seconds
        }
    }
}
