//
//  ItemTableViewCell.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import UIKit

public final class ItemTableViewCell: UITableViewCell {
    
    // MARK: Graphic attributes
    
    @IBOutlet private weak var titleTextField: UITextField!
    
    // MARK: Attributes
    
    private var currentItem: Item?
    public var didEndEditingItem: ((Item) -> Void)?
    
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
