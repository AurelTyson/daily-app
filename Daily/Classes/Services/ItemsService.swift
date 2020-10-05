//
//  ItemsService.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import Foundation

public final class ItemsService {
    
    // MARK: Singleton
    
    public static let shared = ItemsService()
    
    // MARK: Attributes
    
    private let userDefaults = UserDefaults.standard
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()
    
    // MARK: Init
    
    private init() {
        
    }
    
    // MARK: Methods
    
    public func items() -> [Item] {
        
        // Get and decode data
        guard let data = self.userDefaults.object(forKey: "ITEMS") as? Data,
              let decoded = try? self.jsonDecoder.decode([Item].self, from: data) else {
            return []
        }
        
        // Return decoded data
        return decoded
        
    }
    
    public func saveItem(item: Item) {
        
        // Get items
        var items = self.items()
        
        if let index = items.firstIndex(where: { $0.uuid == item.uuid }) {
            
            // Replace the item
            items[index] = item
            
        }
        else {
            
            // Add the item
            items.append(item)
            
        }
        
        // Save list
        self.saveItems(items)
        
    }
    
    public func deleteItem(uuid: String) {
        
        // Get items and remove the corresponding
        var items = self.items()
        
        // Remove the item
        items.removeAll(where: { $0.uuid?.uuidString == uuid })
        
        // Save list
        self.saveItems(items)
        
    }
    
    private func saveItems(_ items: [Item]) {
        
        // Encode favorites
        guard let encoded = try? self.jsonEncoder.encode(items) else {
            return
        }
        
        // Save favorites
        self.userDefaults.setValue(encoded, forKey: "ITEMS")
        
    }
    
}
