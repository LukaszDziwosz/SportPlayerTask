//
//  EventViewModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit
import Kingfisher

protocol EventListViewModelProtocol {
    func fetch()
    func numberOfRowsInSection (_ section: Int) -> Int
    func eventAtIndex (_ index: Int) -> EventViewModel
    var tableView: UITableView? { get set }
}

class EventListViewModel: EventListViewModelProtocol {

    private let manager: EventListManagerProtocol
    private var events:[Event] = []
    weak var tableView: UITableView?
    
    init(manager: EventListManagerProtocol = EventListManager()) {
        self.manager = manager
    }
    
    func fetch(){
        manager.getEvents { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let events):
                self.events = events
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            case .failure(let error):
                let message = error.localizedDescription
                print(message)
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
    var imageUrl: String { return event.imageUrl ?? "https://img.lovepik.com/element/40030/3721.png_860.png" }
    var date: String { return DateFormatter.string(apiDate: event.date) }
    var videoUrl: String {return event.videoUrl}
}
