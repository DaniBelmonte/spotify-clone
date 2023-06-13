//
//  MiniPlayerView.swift
//  spotify-clone
//
//  Created by Dani on 12/6/23.
//

import SwiftUI
import AVKit

struct MiniPlayerView: View {
    @StateObject private var viewModel = MiniPlayerViewModel()
    @State private var backgroundColor: Color = .clear
    @State private var audioPlayer: AVAudioPlayer!
    @State private var timer: Timer?


    fileprivate func setupAudioPlayer() {
        let sound = Bundle.main.path(forResource: "Adele - Easy On Me", ofType: "mp3")
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    }

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 0) {
                HStack {
                    Image("adele")
                        .resizable()
                        .font(.title)
                        .frame(width: 40, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .padding(.leading, 4)
                        .padding(.vertical, 4)

                    VStack(alignment: .leading) {
                        Text("Easy On Me")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.white)
                        Text("Adele")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            viewModel.isFavorite.toggle()
                        }) {
                            Image(systemName: viewModel.isFavorite ? "heart" : "heart.fill")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        Button(action: {
                            viewModel.isPlaying.toggle()
                            if viewModel.isPlaying {
                                audioPlayer?.play()
                                startTimer()
                                print("play")
                            } else {
                                audioPlayer?.pause()
                                stopTimer()
                                print("pause")
                            }
                        }) {
                            Image(systemName: viewModel.isPlaying ? "pause" : "play.fill")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .padding(4)
                    }
                    .frame(width: 80, height: 40, alignment: .center)
                }
                ProgressView(value: viewModel.progress)
                    .padding(0)
                    .tint(.white)
                    .frame(height: 1)
            }
            .background(backgroundColor)
            .cornerRadius(10)
            .padding(.bottom, 110)
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
        } .onAppear {
            setAverageColor()
            setupAudioPlayer()
        } .onDisappear {
            stopTimer()
            audioPlayer.pause()
        }
    }

    // MARK: - Functions
    private func setAverageColor() {
        if let image = UIImage(named: "adele") {
            let averageColor = Color(uiColor: image.averageColor ?? .clear)
            backgroundColor = averageColor
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            guard let audioPlayer = audioPlayer else {
                return
            }

            viewModel.progress = audioPlayer.currentTime / audioPlayer.duration
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // MARK: - Preview
    struct MiniPlayerView_Previews: PreviewProvider {
        static var previews: some View {
            MiniPlayerView()
        }
    }
}
