//
//  ContentView.swift
//  Neotek Remote
//
//  Created by Daniel Hooper on 2021-05-01.
//

import SwiftUI

// A toggleable button, for muting and unmuting Neotek channels
struct MuteButton: View {

    let channel: Int
    @Binding var isMuted: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .foregroundColor(isMuted ? .red : .gray)
            Text("\(channel)")
                .foregroundColor(.white)
                .font(.title)
        }
        .frame(width: 120, height: 120)
        .onTapGesture {
            isMuted = !isMuted
        }
    }
}
//
//struct NeotekStyle: ButtonStyle {
//    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
//        Circle()
//            .fill(Color.green)
//            .overlay(
//                Circle()
//                    .stroke(lineWidth: 2)
//                    .foregroundColor(.white)
//                    .padding(4)
//            )
//            .overlay(
//                configuration.label
//                    .foregroundColor(.white)
//            )
//            .frame(width: 75, height: 75)
//    }
//}

struct NeotekButton: View {
    let channel: Int
    @Binding var isMuted: Bool
    
    var body: some View {
        Button(buttonStyle(NeotekStyle))
    }
}

struct SimplerView: View {
    
    let neotek = Neotek()
}

struct ContentView: View {
    
    let neotek = Neotek()
    
    @State var channel1Muted = false
    @State var channel2Muted = false
    @State var channel3Muted = false
    @State var channel4Muted = false
    @State var channel5Muted = false
    @State var channel6Muted = false
    @State var channel7Muted = false
    @State var channel8Muted = false
    
    var body: some View {
        VStack {
            HStack {
                MuteButton(channel: 1, isMuted: $channel1Muted).onChange(of: channel1Muted) { state in
                    neotek.muteChannel(1, isMuting: state)
                }
                .padding()
                MuteButton(channel: 2, isMuted: $channel2Muted).onChange(of: channel2Muted) { state in
                    neotek.muteChannel(2, isMuting: state)
                }
                .padding()
            }
            HStack {
                MuteButton(channel: 3, isMuted: $channel3Muted).onChange(of: channel3Muted) { state in
                    neotek.muteChannel(3, isMuting: state)
                }
                .padding()
                MuteButton(channel: 4, isMuted: $channel4Muted).onChange(of: channel4Muted) { state in
                    neotek.muteChannel(4, isMuting: state)
                }
                .padding()
            }
            HStack {
                MuteButton(channel: 5, isMuted: $channel5Muted).onChange(of: channel5Muted) { state in
                    neotek.muteChannel(5, isMuting: state)
                }
                .padding()
                MuteButton(channel: 6, isMuted: $channel6Muted).onChange(of: channel6Muted) { state in
                    neotek.muteChannel(6, isMuting: state)
                }
                .padding()
            }
            HStack {
                MuteButton(channel: 7, isMuted: $channel7Muted).onChange(of: channel7Muted) { state in
                    neotek.muteChannel(7, isMuting: state)
                }
                .padding()
                MuteButton(channel: 8, isMuted: $channel8Muted).onChange(of: channel8Muted) { state in
                    neotek.muteChannel(8, isMuting: state)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
