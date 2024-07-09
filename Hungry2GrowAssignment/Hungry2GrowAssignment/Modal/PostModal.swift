//
//  PostModal.swift
//  Hungry2GrowAssignment
//
//  Created by Chetan Sanwariya on 12/04/24.
//

import Foundation

struct PostModal : Codable, Identifiable, Hashable {
    var userId : Int
    var id : Int
    var title : String
    var body : String
}
