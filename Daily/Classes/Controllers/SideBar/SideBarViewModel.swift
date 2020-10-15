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
    
    // MARK: Enums
    
    public enum SelectedEntry {
        case todoLists
        case calendar
    }
    
    // MARK: Input / Output
    
    public struct Input {
        let tapMenuButtonTodoLists: Observable<Void>
        let tapMenuButtonCalendar: Observable<Void>
    }
    
    public struct Output {
        let selectedEntry: Driver<SelectedEntry>
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
        
        // Outputs
        let selectedEntry = BehaviorRelay<SelectedEntry>(value: .todoLists)
        
        // Selected entry
        selectedEntry
            .skip(1)
            .subscribe { [weak self] (entry: SelectedEntry) in
                
                switch entry {
                
                case .todoLists:
                    self?.router.trigger(.todoLists)
                
                case .calendar:
                    self?.router.trigger(.calendar)
                    
                }
                
            }
            .disposed(by: self.disposeBag)
        
        // Tap todo lists
        input.tapMenuButtonTodoLists
            .subscribe { _ in
                
                // Show todo lists
                selectedEntry.accept(.todoLists)
                
            }
            .disposed(by: self.disposeBag)
        
        // Tap calendar
        input.tapMenuButtonCalendar
            .subscribe { _ in
                
                // Show calendar
                selectedEntry.accept(.calendar)
                
            }
            .disposed(by: self.disposeBag)
        
        // Output
        return Output(
            selectedEntry: selectedEntry.asDriver()
        )
        
    }
    
    // MARK: Methods
    
}
