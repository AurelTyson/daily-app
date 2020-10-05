//
//  Item.swift
//  Daily
//
//  Created by Aurélien Tison on 05/10/2020.
//

import Foundation

public final class Item: Codable {
    
    // MARK: Attributes
    
    public var uuid: UUID?
    public var title: String?
    public var createdAt: Date?
    public var order: Int?
    
    // MARK: Init
    
    public init() {
        
    }
    
}
