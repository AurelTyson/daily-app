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
    
    // MARK: TableViewCell
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell
        self.selectionStyle = .none
        
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Methods
    
    public func configure(item: Item) {
        
        // Title
        self.titleTextField.text = item.title ?? ""
        
    }
    
}
