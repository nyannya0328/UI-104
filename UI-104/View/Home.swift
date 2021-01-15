//
//  Home.swift
//  UI-104
//
//  Created by にゃんにゃん丸 on 2021/01/15.
//

import SwiftUI

struct Home: View {
    @StateObject var model = HomeViewModel()
    
    @GestureState var Gestureoffset : CGFloat = 0
    var body: some View {
        ZStack(alignment: .bottom, content: {
            
            
            ScrollView{
                
                VStack(spacing:15){
                    
                    ForEach(videos){video in
                        
                        VideoCardView(video: video)
                        
                    }
                    .onTapGesture {
                        model.showplyer.toggle()
                    }
                }
            }
            
            if model.showplyer{
                
                MiniPlayerView()
                    .transition(.move(edge: .top))
                    .offset(y: model.offset)
                    .gesture(DragGesture().updating($Gestureoffset, body: { (value, state, _) in
                        state = value.translation.height
                    }) .onEnded(onEnd(value:)))
                
            }

            
            
            
        })
        .onChange(of: Gestureoffset, perform: { value in
            onChange()
        })
        .environmentObject(model)
      
        
        
    }
    
    func onChange(){
        
        if Gestureoffset > 0 && !model.isMiniPlayer && model.offset + 70 <= model.heigth{
        
        model.offset = Gestureoffset
        }
    }
    
    func onEnd(value:DragGesture.Value){
        
        withAnimation(.default){
           
            
            
            if !model.isMiniPlayer{
                model.offset = 0
                
                if value.translation.height > UIScreen.main.bounds.height / 3{
                    
                    
                    model.isMiniPlayer = true
                    
                }
                
                else{
                    
                    model.isMiniPlayer = false
                }
            }
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
