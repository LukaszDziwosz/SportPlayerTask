//
//  ScheduleViewModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 13/10/2021.
//

import UIKit

protocol ScheduleListViewModelProtocol {
    func fetchSchedules(_ completion: @escaping ([Schedule]) -> Void)
    func filterSchedules(array :[Schedule]) -> [Schedule]
}

class ScheduleListViewModel: ScheduleListViewModelProtocol {
    
    private let manager: ListManagerProtocol
    private var schedules: [Schedule] = []
    
    init(manager: ListManagerProtocol = ListManager()) {
        self.manager = manager
        
    }
    
    func fetchSchedules(_ completion: @escaping ([Schedule]) -> Void) {
        manager.getSchedules { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let schedules):
                self.schedules = self.filterSchedules(array: schedules)
                completion(self.schedules)
            case .failure(let error):
                let message = error.localizedDescription
                print(message)
                // TODO display error in alert
                }
        }
    }
    func filterSchedules(array :[Schedule]) -> [Schedule] {
        let ordered = array.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
//        let dateChanged = ordered.map {DateFormatter.string(apiDate: $0.date)
//        }
//        print(dateChanged)
        // TODO Add filter to display tomorrow only and change dates to requested format here as well
        return ordered
    }
    


    
}

