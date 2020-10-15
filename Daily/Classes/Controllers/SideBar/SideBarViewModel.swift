//
//  SideBarViewModel.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import Foundation
import RxCocoa
import RxSwift
import XCoordinator

public class SideBarViewModel {
    
    // MARK: Input / Output
    
    public struct Input {
        let tapMenuButtonTodoLists: Observable<Void>
        let tapMenuButtonCalendar: Observable<Void>
    }
    
    public struct Output {
    }
    
    // MARK: Services
    
    // MARK: Attributes
    
    private let router: UnownedRouter<SideBarRoute>
    private let disposeBag = DisposeBag()
    
    // MARK: Init
    
    public init(router: UnownedRouter<SideBarRoute>) {
        
        // Init
        self.router = router
        
    }
    
    // MARK: Transform
    
    public func transform(input: SideBarViewModel.Input) -> SideBarViewModel.Output {
        
        // Todo lists
        input.tapMenuButtonTodoLists
            .subscribe { [weak self] _ in
                
                // Show todo lists
                self?.router.trigger(.todoLists)
                
            }
            .disposed(by: self.disposeBag)
        
        // Calendar
        input.tapMenuButtonCalendar
            .subscribe { [weak self] _ in
                
                // Show calendar
                self?.router.trigger(.calendar)
                
            }
            .disposed(by: self.disposeBag)
        
        // Output
        return Output(
        )
        
    }
    
    // MARK: Methods
    
}
