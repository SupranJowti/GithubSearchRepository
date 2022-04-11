//
//  RepositoriesViewController.swift
//  SearchMobileApp
//
//  Created by Supran on 2022/04/10.
//

import UIKit

protocol UIViewable: AnyObject {
    func viewModify(_ isAnimating: Bool)
    func refreshUI()
    func showError(_ message: String)
}

class RepositoriesViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lblModifiedDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel:RepositriesViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RepositoriesViewModel(delegate: self)
        
        setupSearchView()
        setupTableSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.searchBar.becomeFirstResponder()
    }
    
}


extension RepositoriesViewController: UIViewable {
    func viewModify(_ isAnimating: Bool) {
        isAnimating ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        lblModifiedDate.text = isAnimating ? "Requesting.." : "Responsed Time: " + Date().getCurrentDateTime()
    }
    
    func refreshUI() {
        reloadData()
    }
    
    func showError(_ message: String) {
        lblModifiedDate.text = "Error: " + message
    }
}


extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableSettings() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing:UITableViewCell.self))
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    //MARK: UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return viewModel.getTotalItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:UITableViewCell.self), for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = viewModel.getItemFor(indexPath.row)?.name
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


extension RepositoriesViewController: UISearchBarDelegate {
    func setupSearchView() {
        let color = UIColor.black
        searchBar.tintColor = color
        searchBar.barTintColor = UIColor.blue
        searchBar.backgroundImage = UIImage.init()
        
        if let txtField = searchBar.value(forKey: "searchField") as? UITextField {
            txtField.backgroundColor = UIColor.clear
            txtField.textColor = color
            txtField.font = UIFont.systemFont(ofSize: 13)
        }
        
        searchBar.delegate = self
        searchBar.placeholder = "Search Repository By Name"
    }
    
    private func emptyCollection() {
        viewModel.clearAll()
        reloadData()
    }
    
    @objc private func onSearch() {
        emptyCollection()
        if let searchText = searchBar.text, !searchText.isEmpty {
            viewModel.fetchRepository(query: searchText)
        }
    }

    
    //MARK: UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.onSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(onSearch), object: nil)
        self.perform(#selector(onSearch), with: nil, afterDelay: 0.3)
    }
    
}


extension Date {
    func getCurrentDateTime() -> String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date/Time Style
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        // Convert Date to String
        return dateFormatter.string(from: self)
    }
}
