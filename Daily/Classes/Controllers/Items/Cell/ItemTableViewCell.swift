//
//  ItemTableViewCell.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import RxCocoa
import RxSwift
import UIKit

public final class ItemTableViewCell: UITableViewCell {
    
    // MARK: Graphic attributes
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var deleteButton: UIButton!
    
    // MARK: Attributes
    
    private var currentItem: Item?
    public var didEndEditingItem: ((Item) -> Void)?
    public var didDeleteItem: ((Item) -> Void)?
    
    private var disposeBag = DisposeBag()
    
    // MARK: TableViewCell
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell
        self.selectionStyle = .none
        
        // Title
        self.titleTextField.delegate = self
        
        // Reset data
        self.currentItem = nil
        self.didEndEditingItem = nil
        self.disposeBag = DisposeBag()
        
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Methods
    
    public func configure(item: Item) {
        
        // Save item
        self.currentItem = item
        
        // Title
        self.titleTextField.text = item.title ?? ""
        
        // Delete
        self.deleteButton.rx.tap
            .subscribe { [weak self] _ in
                guard let item = self?.currentItem else {
                    return
                }
                self?.didDeleteItem?(item)
            }
            .disposed(by: self.disposeBag)
        
    }
    
}

extension ItemTableViewCell: UITextFieldDelegate {
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Get item
        guard let item = self.currentItem else {
            return
        }
        
        // Update title
        item.title = textField.text
        
        // Save item
        self.didEndEditingItem?(item)
        
    }
    
}
