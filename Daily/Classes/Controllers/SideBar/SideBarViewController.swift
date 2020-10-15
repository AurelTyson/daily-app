//
//  SideBarViewController.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import RxCocoa
import RxSwift
import UIKit

public final class SideBarViewController: UIViewController, BindableType {
    
    // MARK: Constants
    
    // MARK: Graphic attributes
    
    @IBOutlet private weak var menuButtonTodoLists: UIButton!
    @IBOutlet private weak var menuButtonCalendar: UIButton!
    
    // MARK: Attributes
    
    public var viewModel: SideBarViewModel!
    
    private let disposeBag = DisposeBag()
    
    // MARK: View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Bind
    
    public func bindViewModel() {
        
        // Input for viewModel
        let input = SideBarViewModel.Input(
            tapMenuButtonTodoLists: self.menuButtonTodoLists.rx.tap.asObservable(),
            tapMenuButtonCalendar: self.menuButtonCalendar.rx.tap.asObservable()
        )
        
        // Transform input to output
        let output = self.viewModel.transform(input: input)
        
    }
    
}
