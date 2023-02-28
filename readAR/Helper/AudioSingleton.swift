//
//  AudioSingleton.swift
//  readAR
//
//  Created by Zidan Ramadhan on 27/02/23.
//

import AVFoundation

class AudioSingleton {
    var player: AVAudioPlayer?
    static let sharedInstance = AudioSingleton()
    
    func playSound(audioName: String) {
        guard let url = Bundle.main.url(forResource: audioName, withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        player?.pause()
    }
}

