//
//  ItemsViewController.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import RxCocoa
import RxSwift
import UIKit

public final class ItemsViewController: UIViewController, BindableType {
    
    // MARK: Text
    
    fileprivate enum Text {
        
        fileprivate static let title = ""
        
    }
    
    // MARK: Constants
    
    // MARK: Graphic attributes
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Attributes
    
    public var viewModel: ItemsViewModel!
    
    private let disposeBag = DisposeBag()
    
    // MARK: View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // The tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(cellType: ItemTableViewCell.self)
        
    }
    
    // MARK: Bind
    
    public func bindViewModel() {
        
        // Input for viewModel
        let input = ItemsViewModel.Input()
        
        // Transform input to output
        let output = self.viewModel.transform(input: input)
        
    }
    
}

extension ItemsViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Getting the cell
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ItemTableViewCell.self)
        
        // Configure
        cell.configure(item: self.viewModel.items[indexPath.row])
        
        // Return the configured cell
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
