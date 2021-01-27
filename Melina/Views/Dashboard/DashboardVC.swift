//
//  DashboardVC.swift
//  Melina
//
//  Created by Joni G. on 1/27/21.
//

import UIKit

class DashboardVC: UIViewController {
    
    var presenter: DashboardPresenterr?
    
    let searchBarController: UISearchController = {
        let searchController = UISearchController()
        searchController.automaticallyShowsCancelButton = true
        return searchController
    }()
    
    let itemsTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.register(ItemCell.self, forCellReuseIdentifier: DashboardConstants.cellId)
        return tbv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        view.addSubview(itemsTableView)
        itemsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        itemsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        itemsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension DashboardVC: DashboardView {
    
    func refreshData() {
        itemsTableView.reloadData()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = DashboardConstants.titleView
        searchBarController.delegate = self
        navigationItem.searchController = searchBarController
        navigationItem.searchController?.searchBar.delegate = self
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
    }
}

extension DashboardVC: UISearchControllerDelegate {
    
}

extension DashboardVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let inputSearch = searchBar.text else { return }
        presenter?.searchItem(search: inputSearch)
        searchBar.resignFirstResponder()
    }
}

extension DashboardVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DashboardConstants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.itemPressed(in: indexPath.row)
    }
}

extension DashboardVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.itemsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DashboardConstants.cellId, for: indexPath) as! ItemCell
        cell.prepareForReuse()
        presenter?.configure(cell, in: indexPath.row)
        return cell
    }
}


