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
    
    private let router: UnownedRouter<MainRoute>
    private let disposeBag = DisposeBag()
    
    // MARK: Init
    
    public init(router: UnownedRouter<MainRoute>) {
        
        // Init
        self.router = router
        
    }
    
    // MARK: Transform
    
    public func transform(input: ItemsViewModel.Input) -> ItemsViewModel.Output {
        
        // Output
        return Output(
        )
        
    }
    
}
