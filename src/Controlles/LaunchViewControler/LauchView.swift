//
//  LauchView.swift
//  Plani
//
//  Created by Raad Amar on 04.05.25.
//

import UIKit
import AVKit

class LauchView: UIViewController {
    private var player: AVPlayer?
    let NameOfVideo = Datastructur.Functions.PlayVideoToday()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        try? AVAudioSession.sharedInstance().setCategory(.ambient, options: [.mixWithOthers])
        try? AVAudioSession.sharedInstance().setActive(true)
        playIntroVideo()
    }
    
    private func playIntroVideo() {
        guard let path = Bundle.main.path(forResource: NameOfVideo, ofType: "mp4") else { return }
        let playerItem = AVPlayerItem(url: URL(fileURLWithPath: path))
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd),
                                               name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.player?.seek(
                to: .zero,
                toleranceBefore: .zero,
                toleranceAfter: .zero
            ) { _ in
                self.player?.play()
            }
        }
    }
    
    @objc private func videoDidEnd() {
        performSegue(withIdentifier: k.segues.GoToMain, sender: self)
    }
    
}
