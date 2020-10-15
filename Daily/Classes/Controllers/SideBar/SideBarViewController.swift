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
        
        // Todo lists
        self.menuButtonTodoLists.layer.cornerRadius = 5
        self.menuButtonTodoLists.setTitleColor(.blackCoral, for: .normal)
        self.menuButtonTodoLists.tintColor = .blackCoral
        
        // Calendar
        self.menuButtonCalendar.layer.cornerRadius = 5
        self.menuButtonCalendar.setTitleColor(.blackCoral, for: .normal)
        self.menuButtonCalendar.tintColor = .blackCoral
        
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
        
        // Todo lists
        output.selectedEntry
            .map({ $0 == .todoLists })
            .drive(onNext: { [weak self] (isSelected: Bool) in
                self?.menuButtonTodoLists.backgroundColor = isSelected ? .lightBlue : .clear
            })
            .disposed(by: self.disposeBag)
        
        // Calendar
        output.selectedEntry
            .map({ $0 == .calendar })
            .drive(onNext: { [weak self] (isSelected: Bool) in
                self?.menuButtonCalendar.backgroundColor = isSelected ? .lightBlue : .clear
            })
            .disposed(by: self.disposeBag)
        
    }
    
}
