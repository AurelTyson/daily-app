//
//  CalendarCoordinator.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import UIKit
import XCoordinator

public enum CalendarRoute: Route {
    
    case calendar
    
}

public final class CalendarCoordinator: NavigationCoordinator<CalendarRoute> {
    
    // MARK: Services
    
    private let itemsService = ItemsService.shared
    
    // MARK: Init
    
    public init() {
        super.init(initialRoute: .calendar)
        
        // NavigationController configuration
        self.rootViewController.navigationBar.isHidden = true
        
    }
    
    // MARK: NavigationCoordinator
    
    override public func prepareTransition(for route: CalendarRoute) -> NavigationTransition {
        
        switch route {
        
        case .calendar:
            let vc = CalendarViewController.instantiateFromNib()
            let vm = CalendarViewModel(router: self.unownedRouter)
            vc.bind(to: vm)
            return .push(vc)
            
        }
        
    }
    
}
