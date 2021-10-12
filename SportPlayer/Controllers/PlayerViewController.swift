//
//  PlayerViewController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 12/10/2021.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var playerContainerView: UIView!
    
    // Reference for the player view.
    private var playerView: PlayerView!
    
    // URL for the test video.
    private let videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPlayerContainerView()
        setUpPlayerView()
        guard let url = URL(string: videoURL) else { return }
        playerView.play(with: url)

    }
    private func setUpPlayerContainerView() {
        playerContainerView = UIView()
        playerContainerView.backgroundColor = .black
        view.addSubview(playerContainerView)
        playerContainerView.translatesAutoresizingMaskIntoConstraints = false
        playerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        playerContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
            
        if #available(iOS 11.0, *) {
            playerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            playerContainerView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        }
    }
    private func setUpPlayerView() {
        playerView = PlayerView()
        playerContainerView.addSubview(playerView)
            
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.leadingAnchor.constraint(equalTo: playerContainerView.leadingAnchor).isActive = true
        playerView.trailingAnchor.constraint(equalTo: playerContainerView.trailingAnchor).isActive = true
        playerView.heightAnchor.constraint(equalTo: playerContainerView.widthAnchor, multiplier: 16/9).isActive = true
        playerView.centerYAnchor.constraint(equalTo: playerContainerView.centerYAnchor).isActive = true
    }
    func playVideo() {
        guard let url = URL(string: videoURL) else { return }
        playerView.play(with: url)
    }

}
