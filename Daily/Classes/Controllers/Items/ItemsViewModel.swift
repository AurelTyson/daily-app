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
    }
    
    public struct Output {
    }
    
    // MARK: Attributes
    
    public var items = [Item]()
    
    private let router: UnownedRouter<MainRoute>
    private let disposeBag = DisposeBag()
    
    // MARK: Init
    
    public init(router: UnownedRouter<MainRoute>) {
        
        // Init
        self.router = router
        
    }
    
    // MARK: Transform
    
    public func transform(input: ItemsViewModel.Input) -> ItemsViewModel.Output {
        
        // Fake data
        let fakeItem = Item()
        fakeItem.uuid = UUID()
        fakeItem.title = "Fake title"
        self.items = [Item](repeating: fakeItem, count: 20)
        
        // Output
        return Output(
        )
        
    }
    
}
