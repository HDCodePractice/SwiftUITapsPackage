//
//  AVAudioPlayerControlView.swift
//
//
//  Created by 老房东 on 2022-09-27.
//

import AVFAudio
import SwiftUI

struct AVAudioPlayerControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "AVAudioPlayer",
                    url: "https://developer.apple.com/documentation/avfaudio/avaudioplayer",
                    description: String(localized: "An object that plays audio data from a file or buffer.")
                )
                AVAudioPlayerSampleView()
            }
            .padding()
        }
    }
}

private struct AVAudioPlayerSampleView: View {
    var code = """
    struct AVAudioPlayerSampleView: View {
        @State var player: AVAudioPlayer? = nil
        var body: some View {
            Button {
                if player == nil {
                    player = try! AVAudioPlayer(
                        contentsOf: Bundle.module.url(
                            forResource: "sample-audio",
                            withExtension: "mp3"
                        )!
                    )
                }
                player!.play()
            } label: {
                Image(systemName: "play.circle.fill")
            }
            Button {
                if let player {
                    player.pause()
                }
            } label: {
                Image(systemName: "pause.circle.fill")
            }
        }
    }
    """

    @State var player: AVAudioPlayer? = nil
    var body: some View {
        VStack {
            Text("Create a AVAudioPlayer")
                .font(.title2)
            CodePreviewView(code: code)
            HStack {
                Spacer()
                Button {
                    if player == nil {
                        player = try! AVAudioPlayer(
                            contentsOf: Bundle.module.url(
                                forResource: "sample-audio",
                                withExtension: "mp3"
                            )!
                        )
                    }
                    player!.play()
                } label: {
                    Image(systemName: "play.circle.fill")
                }
                Button {
                    if let player {
                        player.pause()
                    }
                } label: {
                    Image(systemName: "pause.circle.fill")
                }
                Spacer()
            }
            .font(.title)
            .foregroundColor(.white)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 10).fill(.secondary))
            .opacity(0.8)
        }
    }
}

struct AVAudioPlayerControlView_Previews: PreviewProvider {
    static var previews: some View {
        AVAudioPlayerControlView()
    }
}
