//
//  TableViewController.swift
//  VIPER Demo
//
//  Created by Adithya hayagreeva on 5/25/20.
//  Copyright © 2020 Emirates NBD. All rights reserved.
//

import UIKit
import RxSwift

class TableViewController: UITableViewController {

    //MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var _presenter: Presenter?
    private var presenter: Presenter {
        guard let presenter = _presenter else { fatalError("presenter not initialized") }
        return presenter
    }
    
    //MARK: - ViewController lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindPresenter()
        presenter.initializeContentLoad()
    }

    //MARK: - Private methods
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.tableFooterView = nil
    }
    
    private func bindPresenter() {
        presenter.contentUpdated
            .subscribe(
                onNext: { [weak self] in
                    self?.tableView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    //MARK: - Public methods
    
    public static func instance(withPresenter presenter: Presenter) -> TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let tableViewController = storyboard.instantiateViewController(identifier: "TableViewController") as? TableViewController else {
            fatalError()
        }
        tableViewController._presenter = presenter
        return tableViewController
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let imageData = presenter.imageItem(forIndex: indexPath.row)
        if let imageURL = URL(string: imageData.url) {
            cell.configure(imageURL: imageURL)
        }
        return cell
    }

}
