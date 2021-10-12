//
//  ViewController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit
import AVKit

class EventsViewController: UIViewController {
  
    private var viewModel: EventListViewModelProtocol?
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
    return tableView
    }()
    
    init (viewModel: EventListViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
        viewModel?.tableView = tableView
        viewModel?.fetch()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.cellIdentifier)
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
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
        let eventVM = self.viewModel?.eventAtIndex(indexPath.row)
        cell.titleLabel.text = eventVM?.title
        cell.dateLabel.text = eventVM?.date
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventVM = self.viewModel?.eventAtIndex(indexPath.row)
        let videoURL = URL(string: eventVM!.videoUrl)
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
}

