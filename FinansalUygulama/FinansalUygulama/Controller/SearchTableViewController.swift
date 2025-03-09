//
//  SearchTableViewController.swift
//  FinansalUygulama
//
//  Created by Mehmet Seyhan on 9.03.2025.
//

import UIKit
import Combine
import MBProgressHUD

class SearchTableViewController: UITableViewController, UIAnimatable {

    private enum Mode{
        case onboarding
        case search
    }
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Bir sirket adi veya sembol giriniz..."
        sc.searchBar.autocapitalizationType = .allCharacters
        return sc
    }()
    
    private let apiService = APIService()
    private var subscribers = Set<AnyCancellable>()
    private var searchResults: SearchResults?
    
    @Published private var mode: Mode = .onboarding
    @Published private var searchQuery = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        observeForm()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func setupNavigationBar(){
        navigationItem.searchController = searchController
        navigationItem.title = "Ara"
    }
    
    private func setupTableView(){
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView()
    }
    
    private func observeForm(){
        $searchQuery
            .debounce(for: .milliseconds(750), scheduler: RunLoop.main)
            .sink { [unowned self] (searchQuery) in
                guard !searchQuery.isEmpty else { return }
                showLoadingAnimation()
                self.apiService.fetchSymbolsPublisher(keywords: searchQuery).sink { completion in
                    self.hideLoadingAnimation()
                    switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .finished: break
                    }
                } receiveValue: { searchResults in
                    self.searchResults = searchResults
                    self.tableView.reloadData()
                    self.tableView.isScrollEnabled = true
                }.store(in: &self.subscribers)
            }.store(in: &subscribers)
        
        $mode.sink { [unowned self] (mode) in
            switch mode {
            case .onboarding:
                self.tableView.backgroundView = SearchPlaceholderView()
            case .search:
                self.tableView.backgroundView = nil
            }
        }.store(in: &subscribers)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResults?.items.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! SearchTableViewCell
        if let searchResults = self.searchResults {
            let searchResult = searchResults.items[indexPath.row]
            cell.configure(with: searchResult)
        }

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let searchResults = self.searchResults {
            let searchResult = searchResults.items[indexPath.item]
            let symbol = searchResult.symbol
            handleSelection(for: symbol, searchResult: searchResult)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func handleSelection(for symbol: String, searchResult: SearchResult){
        showLoadingAnimation()
        apiService.fetchTimeSeriesMonthlyAdjustedPublisher(keywords: symbol).sink { completionResult in
            self.hideLoadingAnimation()
            switch completionResult {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished: break
            }
        } receiveValue: { [weak self] (timeSeriesMonthlyAdjusted) in
            self?.hideLoadingAnimation()
            let asset = Asset(searchResult: searchResult, timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
            self?.performSegue(withIdentifier: "showCalculator", sender: asset)
            self!.searchController.searchBar.text = nil
        }.store(in: &subscribers)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCalculator", let destination = segue.destination as? CalculatorTableViewController, let asset = sender as? Asset {
            destination.asset = asset
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchQuery = searchController.searchBar.text, !searchQuery.isEmpty else {
           return
        }
        self.searchQuery = searchQuery
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        mode = .search
    }
}
