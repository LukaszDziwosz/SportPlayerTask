//
//  EventViewModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit

protocol EventListViewModelProtocol {
    
    var tableView: UITableView? { get set }
    func fetchEvents()
    func numberOfRowsInSection (_ section: Int) -> Int
    func eventAtIndex (_ index: Int) -> EventViewModel
}

class EventListViewModel: EventListViewModelProtocol {

    private let manager: ListManagerProtocol
    private var events: [Event] = []
    weak var tableView: UITableView?
    
    init(manager: ListManagerProtocol = ListManager()) {
        self.manager = manager
    }
    
    func fetchEvents(){
        manager.getEvents { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let events):
                self.events = events.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            case .failure(let error):
                let message = error.localizedDescription
                print(message)
                // TODO display error in alert
                }
        }
    }
  
    
    func numberOfRowsInSection (_ section: Int) -> Int {
        return events.count
    }
    
    func eventAtIndex (_ index: Int) -> EventViewModel {
        let event = events[index]
        return EventViewModel(event)
    }
}

struct EventViewModel {
    
    private let event: Event

    init(_ event: Event) {
        self.event = event
    }
   
    var title: String { return event.title }
    var subtitle: String { return event.subtitle }
    var imageUrl: String { return event.imageUrl }
    var date: String { return DateFormatter.string(apiDate: event.date) }
    var videoUrl: String {return event.videoUrl}
}
