//
//  VideoPlayerView.swift
//  UI-104
//
//  Created by にゃんにゃん丸 on 2021/01/15.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        
        let bandle_url = Bundle.main.path(forResource: "Coffee - 45358", ofType: "mp4")
        
        let video_url = URL(fileURLWithPath: bandle_url!)
        let player = AVPlayer(url: video_url)
        controller.player = player
        controller.showsPlaybackControls = false
     controller.player?.play()
        controller.videoGravity = .resizeAspectFill
        
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}


