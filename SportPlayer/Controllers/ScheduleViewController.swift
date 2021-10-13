//
//  ScheduleViewController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit
import DiffableDataSources

class ScheduleViewController: UIViewController {
    
    private var viewModel: ScheduleViewModelProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
    return tableView
    }()
    private lazy var dataSource = TableViewDiffableDataSource<Section, Schedule>(tableView: tableView) { tableView, indexPath, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.cellIdentifier, for: indexPath) as! EventTableViewCell
            
            return cell
        }

    init(viewModel: ScheduleViewModelProtocol){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.cellIdentifier)
    }

}
extension ScheduleViewController: UITableViewDelegate {
    
}
