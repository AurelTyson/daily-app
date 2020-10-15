//
//  CalendarViewController.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import RxCocoa
import RxSwift
import UIKit

public final class CalendarViewController: UIViewController, BindableType {
    
    // MARK: Constants
    
    // MARK: Graphic attributes
    
    // MARK: Attributes
    
    public var viewModel: CalendarViewModel!
    
    private let disposeBag = DisposeBag()
    
    // MARK: View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Bind
    
    public func bindViewModel() {
        
        // Input for viewModel
        let input = CalendarViewModel.Input()
        
        // Transform input to output
        let output = self.viewModel.transform(input: input)
        
    }
    
}
