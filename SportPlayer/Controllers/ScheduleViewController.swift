//
//  ScheduleViewController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit
import DiffableDataSources
import Kingfisher

class ScheduleViewController: UIViewController {
    
    private var viewModel: ScheduleListViewModelProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
    return tableView
    }()
    
    private lazy var dataSource = TableViewDiffableDataSource<Section, Schedule>(tableView: tableView) { tableView, indexPath, schedule in
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.cellIdentifier, for: indexPath) as! EventTableViewCell
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        cell.eventImageView.kf.indicatorType = .activity
        cell.eventImageView.kf.setImage(with: URL(string: schedule.imageUrl),  options: [.processor(processor)])
        cell.titleLabel.text = schedule.title
        cell.subtitleLabel.text = schedule.subtitle
        cell.dateLabel.text = DateFormatter.string(apiDate: schedule.date) //TODO move dataformatter to viewModel
            
        return cell
    }

    init(viewModel: ScheduleListViewModelProtocol){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        fetchSchedules()
        setupTableView()
        _ = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(reload), userInfo: nil, repeats: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func fetchSchedules() {
        viewModel?.fetchSchedules{ [weak self] result in
        guard let self = self else { return }
        var snapshot = DiffableDataSourceSnapshot<Section, Schedule>()
        snapshot.appendSections([.main])
        snapshot.appendItems(result)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true) }
        }
    }
    
    @objc func reload() {
        fetchSchedules()
        print("reload")
        //TODO move to viewModel
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.cellIdentifier)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 90
        view.addSubview(tableView)
    }

}

extension ScheduleViewController: UITableViewDelegate {
    
}
