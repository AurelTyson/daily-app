//
//  MainCoordinator.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import UIKit
import XCoordinator

public enum MainRoute: Route {
    
    case items
    case addItem
    case editItem
    case pop
    case dismiss
    
}

public final class MainCoordinator: NavigationCoordinator<MainRoute> {
    
    // MARK: Services
    
    private let itemsService = ItemsService.shared
    
    // MARK: Init
    
    public init() {
        super.init(initialRoute: .items)
        
        // NavigationController configuration
        self.rootViewController.navigationBar.isHidden = true
        
    }
    
    // MARK: NavigationCoordinator
    
    override public func prepareTransition(for route: MainRoute) -> NavigationTransition {
        
        switch route {
        
        case .items:
            let vc = ItemsViewController.instantiateFromNib()
            let vm = ItemsViewModel(router: self.unownedRouter,
                                    itemsService: self.itemsService)
            vc.bind(to: vm)
            return .push(vc)
            
        case .addItem:
            return .none()
            
        case .editItem:
            return .none()
            
        case .pop:
            return .pop()
            
        case .dismiss:
            return .dismiss()
            
        }
        
    }
    
}
