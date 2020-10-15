//
//  SideBarCoordinator.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import UIKit
import XCoordinator

public enum SideBarRoute: Route {
    case sideBar
    case calendar
    case todoLists
}

public final class SideBarCoordinator: NavigationCoordinator<SideBarRoute> {
    
    // MARK: Services
    
    // MARK: Attributes
    
    public var splitCoordinator: UnownedRouter<DailySplitRoute>!
    
    // MARK: Init
    
    public init() {
        super.init(initialRoute: .sideBar)
        
        // NavigationController configuration
        self.rootViewController.navigationBar.isHidden = true
        
    }
    
    // MARK: Overrides
    
    override public func prepareTransition(for route: SideBarRoute) -> NavigationTransition {
        
        switch route {
        
        case .sideBar:
            let vc = SideBarViewController.instantiateFromNib()
            let vm = SideBarViewModel(router: self.unownedRouter)
            vc.bind(to: vm)
            return .push(vc)
            
        case .calendar:
            return .trigger(.calendar,
                            on: self.splitCoordinator)
            
        case .todoLists:
            return .trigger(.todoLists,
                            on: self.splitCoordinator)
            
        }
        
    }
    
}
