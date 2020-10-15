//
//  CalendarViewModel.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import Foundation
import RxCocoa
import RxSwift
import XCoordinator

public class CalendarViewModel {
    
    // MARK: Input / Output
    
    public struct Input {
    }
    
    public struct Output {
    }
    
    // MARK: Services
    
    // MARK: Attributes
    
    private let router: UnownedRouter<CalendarRoute>
    private let disposeBag = DisposeBag()
    
    // MARK: Init
    
    public init(router: UnownedRouter<CalendarRoute>) {
        
        // Init
        self.router = router
        
    }
    
    // MARK: Transform
    
    public func transform(input: CalendarViewModel.Input) -> CalendarViewModel.Output {
        
        // Output
        return Output(
        )
        
    }
    
    // MARK: Methods
    
}
