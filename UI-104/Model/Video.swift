//
//  Video.swift
//  UI-104
//
//  Created by にゃんにゃん丸 on 2021/01/15.
//

import SwiftUI

struct Video: Identifiable {
    var id = UUID().uuidString
    var title : String
    var image : String
}

var videos = [
    Video(title: "Snow Mountain", image: "p1"),
    Video(title: "Dark City", image: "p2"),
    Video(title: "Sea", image: "p3"),
    Video(title: "Dark Window", image: "p4"),
    Video(title: "Controller", image: "p5"),
]
