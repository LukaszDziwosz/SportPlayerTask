//
//  ScheduleViewModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 13/10/2021.
//

import UIKit

protocol ScheduleViewModelProtocol {
    var tableView: UITableView? { get set }
    func fetchSchedules()
    
}

class ScheduleViewModel: ScheduleViewModelProtocol {
    
    private let manager: ListManagerProtocol
    private var schedules: [Schedule] = []
    weak var tableView: UITableView?
    
    init(manager: ListManagerProtocol = ListManager()) {
        self.manager = manager
        _ = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(reload), userInfo: nil, repeats: true)
    }
    
    func fetchSchedules(){
        manager.getSchedules { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let schedules):
                print(schedules)
//                self.schedules = schedules.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
//                DispatchQueue.main.async {
//                    self.tableView?.reloadData()
//                }
            case .failure(let error):
                let message = error.localizedDescription
                print(message)
                // TODO display error in alert
                }
        }
    }
    
    @objc func reload() {
        print("Hello")
    }
    
}
