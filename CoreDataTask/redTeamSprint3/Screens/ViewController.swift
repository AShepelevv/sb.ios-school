//
//  ViewController.swift
//  redTeamSprint3
//
//  Created by Aleksey Shepelev on 22/11/2019.
//  Copyright © 2019 redTeam. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        return tableView
    }()
    
    var fetchResultController : NSFetchedResultsController<MOImage>!
    
    var data : [MOImage]!
    var images : [UIImage]!
    
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
            
        if !UserDefaults.standard.bool(forKey: "isDownloaded") {
            NetworkService().get({
                UserDefaults.standard.set(true, forKey: "isDownloaded")
                self.fetchResultController = CoreDataService().getFetcResultsController()
                self.tableView.reloadData()
            })
        } else {
            self.fetchResultController = CoreDataService().getFetcResultsController()
            self.tableView.reloadData()
        }
    }
    
    private func setupViewController() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        layoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func layoutSubviews() {
        tableView.center = view.center
        tableView.frame = view.frame
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let object = self.fetchResultController?.object(at: indexPath) else {
            fatalError("Attempt to configure cell without a managed object")
        }
        let imageVC = ImageViewController(imageData: object.large)
        navigationController?.pushViewController(imageVC, animated: true)
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let frc = fetchResultController {
            return frc.sections!.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = self.fetchResultController.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath)
        guard let object = self.fetchResultController?.object(at: indexPath) else {
            cell.imageView?.image = UIImage(named: "Unknowen")
            fatalError("Attempt to configure cell without a managed object")
        }
        cell.imageView?.image = UIImage(data: object.small)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionInfo = fetchResultController?.sections?[section] else {
            return nil
        }
        return sectionInfo.name
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return fetchResultController?.sectionIndexTitles
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let result = fetchResultController?.section(forSectionIndexTitle: title, at: index) else {
            fatalError("Unable to locate section for \(title) at index: \(index)")
        }
        return result
    }
}

extension ViewController : NSFetchedResultsControllerDelegate {
    
}


