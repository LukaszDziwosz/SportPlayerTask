//
//  EventViewModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import Foundation

struct EventListViewModel {
    
    let events: [Event]
    
    var numberOfSections: Int { return 1 }
    
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
    private var subtitle: String { return event.subtitle }
    private var imageUrl: String { return event.imageUrl }
    private var date: String { return event.date }
}
