//
//  HomeViewModel.swift
//  UI-104
//
//  Created by にゃんにゃん丸 on 2021/01/15.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var selected = "12.3K"
    
    @Published var offset : CGFloat = 0
    @Published var showplyer = false
    @Published var isMiniPlayer = false
    @Published var heigth : CGFloat = 0
    @Published var width = UIScreen.main.bounds.width
    
    
    
}

