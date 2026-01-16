//
//  WishModel.swift
//  Wishlist
//
//  Created by Preeteesh Remalli on 04/01/26.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
