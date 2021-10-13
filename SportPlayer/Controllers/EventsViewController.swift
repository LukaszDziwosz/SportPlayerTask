//
//  ViewController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit
import AVKit
import Kingfisher

class EventsViewController: UIViewController {
  
    private var viewModel: EventListViewModelProtocol?
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
    return tableView
    }()
    
    init (viewModel: EventListViewModelProtocol){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        fetchEvents()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       }
    
    private func fetchEvents() {
        viewModel?.fetchEvents()
    }

    private func setupTableView() {
        viewModel?.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.cellIdentifier)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 90
        view.addSubview(tableView)
    }
    private func setupVideoPlayer(stringURL: String) {
        let videoURL = URL(string: stringURL)
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return .zero }
        return viewModel.numberOfRowsInSection(section)
      
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.cellIdentifier, for: indexPath) as! EventTableViewCell
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        let eventVM = self.viewModel?.eventAtIndex(indexPath.row)
        cell.titleLabel.text = eventVM?.title
        cell.subtitleLabel.text = eventVM?.subtitle
        cell.dateLabel.text = eventVM?.date
        cell.eventImageView.kf.indicatorType = .activity
        cell.eventImageView.kf.setImage(with: URL(string: eventVM!.imageUrl),  options: [.processor(processor)])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventVM = self.viewModel?.eventAtIndex(indexPath.row)
        setupVideoPlayer(stringURL: eventVM?.videoUrl ?? "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
    }
    
}

