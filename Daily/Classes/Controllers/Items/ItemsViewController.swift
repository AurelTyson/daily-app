//
//  ItemsViewController.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import RxCocoa
import RxSwift
import UIKit

public final class ItemsViewController: UIViewController, BindableType {
    
    // MARK: Text
    
    fileprivate enum Text {
        
        fileprivate static let title = ""
        
    }
    
    // MARK: Constants
    
    // MARK: Graphic attributes
    
    // MARK: Attributes
    
    public var viewModel: ItemsViewModel!
    
    private let disposeBag = DisposeBag()
    
    // MARK: View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Bind
    
    public func bindViewModel() {
        
        // Input for viewModel
        let input = ItemsViewModel.Input()
        
        // Transform input to output
        let output = self.viewModel.transform(input: input)
        
    }
    
}
