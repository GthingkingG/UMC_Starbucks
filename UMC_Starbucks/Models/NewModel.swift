//
//  NewModel.swift
//  UMC_Starbucks
//
//  Created by Air on 5/29/25.
//

import Foundation

struct NewModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var image: String
}
