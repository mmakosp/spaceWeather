//
//  DisplayWeatherTableViewController.swift
//  spaceWeather
//
//  Created by Mmako Sekhosana on 2023/06/12.
//

import UIKit

class DisplayWeatherTableViewController: UITableViewController {
        
    private var viewModel: DisplayWeatherViewModel
    
    init(viewModel: DisplayWeatherViewModel) {
        self.viewModel = viewModel
        super.init(style: .grouped)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "FutureCastTableViewCell", bundle: nil), forCellReuseIdentifier: "FutureCastTableViewCell")
        tableView.estimatedRowHeight = 260
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForFutureCast(at: indexPath)
    }
}

// MARK: - Cells
extension DisplayWeatherTableViewController {
    func cellForFutureCast(at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FutureCastTableViewCell",
                                                       for: indexPath) as? FutureCastTableViewCell else { return UITableViewCell() }
        let forecast = viewModel.futureCastCellModel()
        cell.cellSetup(with: forecast[indexPath.row])
        setCellBackground(with: cell)
        cell.selectionStyle = .none
        return cell
    }
    
    private func setCellBackground(with cell: UITableViewCell) {
        let backgroundColor = UIColor(red: 0.5, green: 0.7, blue: 0.9, alpha: 1.0)
        cell.backgroundColor = backgroundColor
    }
}
