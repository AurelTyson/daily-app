//
//  ItemsViewModel.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import Foundation
import RxCocoa
import RxSwift
import XCoordinator

public class ItemsViewModel {
    
    // MARK: Input / Output
    
    public struct Input {
        let tapAddItem: Observable<Void>
    }
    
    public struct Output {
    }
    
    // MARK: Services
    
    private let itemsService: ItemsService
    
    // MARK: Attributes
    
    public var refreshTrigger = PublishRelay<Void>()
    public var items = [Item]()
    
    private let router: UnownedRouter<MainRoute>
    private let disposeBag = DisposeBag()
    
    // MARK: Init
    
    public init(router: UnownedRouter<MainRoute>,
                itemsService: ItemsService) {
        
        // Init
        self.router = router
        self.itemsService = itemsService
        
    }
    
    // MARK: Transform
    
    public func transform(input: ItemsViewModel.Input) -> ItemsViewModel.Output {
        
        // Tap add item
        input.tapAddItem
            .subscribe { [weak self] _ in
                
                // Add new item
                self?.addNewItem()
                
            }
            .disposed(by: self.disposeBag)
        
        // Refresh items
        self.refreshItems()
        
        // Output
        return Output(
        )
        
    }
    
    // MARK: Methods
    
    private func refreshItems() {
        
        // Load items
        self.items = self.itemsService.items()
            .sorted(by: { (left: Item, right: Item) -> Bool in
                (left.createdAt ?? Date()) < (right.createdAt ?? Date())
            })
        
        // Trigger refresh
        self.refreshTrigger.accept(())
        
    }
    
    private func addNewItem() {
        
        // New item
        let item = Item()
        item.uuid = UUID()
        item.createdAt = Date()
        
        // Save item
        self.itemsService.saveItem(item: item)
        
        // Reload items
        self.refreshItems()
        
    }
    
    public func updateItem(item: Item) {
        
        // Save item
        self.itemsService.saveItem(item: item)
        
        // Reload items
        self.refreshItems()
        
    }
    
}
