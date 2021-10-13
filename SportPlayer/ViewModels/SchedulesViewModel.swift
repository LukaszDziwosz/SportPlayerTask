//
//  ScheduleViewModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 13/10/2021.
//

import UIKit

protocol ScheduleListViewModelProtocol {
    var tableView: UITableView? { get set }
    func fetchSchedules(_ completion: @escaping ([Schedule]) -> Void)
    func numberOfRowsInSection (_ section: Int) -> Int
    func scheduleAtIndex (_ index: Int) -> ScheduleViewModel 
    
}

class ScheduleListViewModel: ScheduleListViewModelProtocol {
    
    private let manager: ListManagerProtocol
    private var schedules: [Schedule] = []
    weak var tableView: UITableView?
    
    init(manager: ListManagerProtocol = ListManager()) {
        self.manager = manager
        _ = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(reload), userInfo: nil, repeats: true)
    }
    
    func fetchSchedules(_ completion: @escaping ([Schedule]) -> Void) {
        manager.getSchedules { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let schedules):
//                self.schedules = schedules.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
//                DispatchQueue.main.async {
//                    self.tableView?.reloadData()
//                }
                completion(schedules)
            case .failure(let error):
                let message = error.localizedDescription
                print(message)
                // TODO display error in alert
                }
        }
    }
    
    @objc func reload() {
        print("reload")
    }
    func numberOfRowsInSection (_ section: Int) -> Int {
        return schedules.count
    }
    func scheduleAtIndex (_ index: Int) -> ScheduleViewModel {
        let schedule = schedules[index]
        return ScheduleViewModel(schedule)
    }
    
}
struct ScheduleViewModel {
    
    private let schedule: Schedule

    init(_ schedule: Schedule) {
        self.schedule = schedule
    }
   
    var title: String { return schedule.title }
    var subtitle: String { return schedule.subtitle }
    var imageUrl: String { return schedule.imageUrl }
    var date: String { return DateFormatter.string(apiDate: schedule.date) }
}
