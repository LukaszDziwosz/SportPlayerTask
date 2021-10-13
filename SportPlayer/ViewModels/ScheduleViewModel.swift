//
//  ScheduleViewModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 13/10/2021.
//

import UIKit

protocol ScheduleViewModelProtocol {
    var tableView: UITableView? { get set }
    
}

class ScheduleViewModel: ScheduleViewModelProtocol {
    
    private let manager: ListManagerProtocol
    private var events:[Schedule] = []
    weak var tableView: UITableView?
    
    init(manager: ListManagerProtocol = ListManager()) {
        self.manager = manager
        _ = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(reload), userInfo: nil, repeats: true)
    }
    @objc func reload() {
        print("Hello")
    }
    
}
