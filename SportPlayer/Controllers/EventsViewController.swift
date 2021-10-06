//
//  ViewController.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import UIKit

class EventsViewController: UITableViewController  {
    
    let cellId = "cellId"
    
    private var eventListVM: EventListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Events"
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: cellId)
        getEvents()
        
    }
    private func getEvents(){
     
        APIClient.fetchData {[weak self] result in
          switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.eventListVM = EventListViewModel(events: data)
                    self?.tableView.reloadData()

                }

            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        eventListVM?.numberOfSections ?? 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventListVM?.numberOfRowsInSection(section) ?? 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EventTableViewCell
       let eventVM = eventListVM?.eventAtIndex(indexPath.row)
        cell.titleLabel.text = eventVM?.title
        
        
        
        return cell
    }
}

