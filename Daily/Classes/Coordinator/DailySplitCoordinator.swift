//
//  DailySplitCoordinator.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import UIKit
import XCoordinator

public enum DailySplitRoute: Route {
    
    case sideBar
    case todoLists
    case calendar
    
}

public final class DailySplitCoordinator: SplitCoordinator<DailySplitRoute> {
    
    // MARK: Attributes
    
    private let sideBarRouter: StrongRouter<SideBarRoute>
    private let todoListsRouter: StrongRouter<ItemsRoute>
    private let calendarRouter: StrongRouter<CalendarRoute>
    
    // MARK: Init
    
    public init(sideBarCoordinator: SideBarCoordinator = SideBarCoordinator(),
                todoListsRouter: StrongRouter<ItemsRoute> = ItemsCoordinator().strongRouter,
                calendarRouter: StrongRouter<CalendarRoute> = CalendarCoordinator().strongRouter) {
        
        // Save
        self.sideBarRouter = sideBarCoordinator.strongRouter
        self.todoListsRouter = todoListsRouter
        self.calendarRouter = calendarRouter
        
        // Init
        super.init(master: self.sideBarRouter,
                   detail: todoListsRouter)
        
        // Save split coordinator
        sideBarCoordinator.splitCoordinator = self.unownedRouter
        
        // Configure SplitView
        self.rootViewController.minimumPrimaryColumnWidth = 280
        self.rootViewController.maximumPrimaryColumnWidth = 280
        self.rootViewController.preferredPrimaryColumnWidth = 280
        self.rootViewController.view.backgroundColor = .lightBlue
        
    }
    
    // MARK: Overrides
    
    override public func prepareTransition(for route: DailySplitRoute) -> SplitTransition {
        
        switch route {
        
        case .sideBar:
            return .show(self.sideBarRouter)
            
        case .todoLists:
            return .showDetail(self.todoListsRouter)
            
        case .calendar:
            return .showDetail(self.calendarRouter)
            
        }
        
    }
    
}
