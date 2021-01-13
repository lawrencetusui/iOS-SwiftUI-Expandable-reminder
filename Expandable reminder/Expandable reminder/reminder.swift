//
//  reminder.swift
//  Expandable reminder
//
//  Created by Lawrence Tsui on 13/1/21.
//

import Foundation
struct  reminder: Decodable {
    let text: String
    let children: [reminder]?
}
