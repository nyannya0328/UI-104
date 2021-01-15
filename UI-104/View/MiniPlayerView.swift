//
//  MiniPlayerView.swift
//  UI-104
//
//  Created by にゃんにゃん丸 on 2021/01/15.
//

import SwiftUI

struct MiniPlayerView: View {
    
    @EnvironmentObject var model : HomeViewModel
    @Namespace var animation
    var body: some View {
        
        VStack(spacing:0){
            HStack{
            
            VideoPlayerView()
                .frame(width: model.isMiniPlayer ? 150 : model.width, height: model.isMiniPlayer ? 70: getFrame())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
            VideoContorollers()
            )
                
                GeometryReader{reader in
                    
                    ScrollView {
                        VStack(spacing:10){
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text("Coffe is Great Smels")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("1.2M View")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundColor(.gray)
                                
                                
                                
                                
                            })
                            .frame(maxWidth: .infinity,alignment: .leading)
                           
                            
                            HStack{
                                
                                PlayBackButton(text: "12.3K", image: "hand.thumbsup", selected: $model.selected, animation: animation)
                                
                                PlayBackButton(text: "0", image: "hand.thumbsdown.fill", selected: $model.selected, animation: animation)
                                
                                PlayBackButton(text: "Share", image: "square.and.arrow.up.fill", selected: $model.selected, animation: animation)
                                
                                PlayBackButton(text: "Download", image: "square.and.arrow.down.fill", selected: $model.selected, animation: animation)
                                
                                PlayBackButton(text: "Live Chat", image: "message.fill", selected: $model.selected, animation: animation)
                           
                            }
                            Divider()
                               
                            
                        
                                
                                ForEach(videos){video in
                                    
                                    VideoCardView(video: video)
                                    
                                }
                            
                            
                            
                        }
                        .padding()
                    }
                    .onAppear(perform: {
                        model.heigth = reader.frame(in: .global).height + 250
                    })
                    
                }
                .background(Color.white)
                .opacity(model.isMiniPlayer ? 0 : getOpacity())
                .frame(height: model.isMiniPlayer ? 0 : nil)
            
            
            
            
        }
        .background(Color.white.ignoresSafeArea(.all, edges: .all)
        .onTapGesture {
            withAnimation{
                
                model.width = UIScreen.main.bounds.width
                model.isMiniPlayer.toggle()
                
            }
        }
        
       )
    }
    
    func getFrame()->CGFloat{
        
        let progess = model.offset / (model.heigth - 100)
        
        if (1 - progess) <= 1.0{
            
            let videoHight : CGFloat = (1 - progess) * 250
            if videoHight <= 70{
                
                let parcent = videoHight / 70
                let videowidth : CGFloat = parcent * UIScreen.main.bounds.width
                
                DispatchQueue.main.async {
                    
                    if videowidth >= 150{
                        
                        model.width = videowidth
                        
                    }
                    
                   
                }
                
                
                return 70
            }
            
            DispatchQueue.main.async {
                model.width = UIScreen.main.bounds.width 
            }
            
            return videoHight
            
        }
        
        
        return 250
        
        
    }
    
    func getOpacity()->Double{
        
        let progress = model.offset / (model.heigth)
        
        if progress <= 1{
            
            return Double(1 - progress)
            
        }
        
        
        
        return 1
        
        
    }
}

struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
    }
}

struct PlayBackButton : View {
    var text : String
    var image : String
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            
            withAnimation{selected = text}
            
        }, label: {
            VStack{
                
                Image(systemName: image)
                    .font(.system(size: 10))
                    .foregroundColor(selected == text ? .red : .black)
                
                
                Text(text)
                    .font(.system(size: 10))
                    .foregroundColor(selected == text ? .red : .black)
                
                ZStack{
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 10, height: 3)
                    
                    if selected == text{
                        
                        Capsule()
                            .fill(Color.green)
                            .frame(width: 10, height: 3)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                        
                    }
                    
                }
                    
                
            }
            .padding()
//            .contentShape(Rectangle())
        })
        .frame(maxWidth: .infinity)
        
        
    }
}

struct VideoContorollers : View {
    
    @EnvironmentObject var model : HomeViewModel
    var body: some View{
        
        HStack(spacing:10){
            
            Rectangle()
                .fill(Color.clear)
                .frame(width: 150, height: 70)
            
            VStack(spacing:10){
                
                Text("Coffee is Fantastic")
                    .font(.title2)
                 
                    .foregroundColor(.black)
                
                Text("Kavsoft")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                
            }
                
                HStack{
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    })
                    
                    Button(action: {
                        model.showplyer.toggle()
                        model.offset = 0
                        model.isMiniPlayer.toggle()
                
                 
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    })
                    
                }
                
            
            
            
        }
        
    }
}
