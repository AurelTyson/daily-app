//
//  CalendarViewController.swift
//  Daily
//
//  Created by Aurélien Tison on 14/10/2020.
//

import CalendarKit
import RxCocoa
import RxSwift
import UIKit

public final class CalendarViewController: UIViewController, BindableType {
    
    // MARK: Constants
    
    // MARK: Graphic attributes
    
    @IBOutlet private weak var dayView: DayView!
    
    // MARK: Attributes
    
    public var viewModel: CalendarViewModel!
    
    private let disposeBag = DisposeBag()
    
    // MARK: View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Calendar style
        var calendarStyle = CalendarStyle()
        calendarStyle.header.backgroundColor = .white
        self.dayView.updateStyle(calendarStyle)
        
        // Calendar configuration
        self.dayView.autoScrollToFirstEvent = true
        
    }
    
    // MARK: Bind
    
    public func bindViewModel() {
        
        // Input for viewModel
        let input = CalendarViewModel.Input()
        
        // Transform input to output
        let output = self.viewModel.transform(input: input)
        
    }
    
}
