//
//  VideoCardView.swift
//  UI-104
//
//  Created by にゃんにゃん丸 on 2021/01/15.
//

import SwiftUI

struct VideoCardView: View {
    
    var video : Video
    var body: some View {
        VStack(spacing:10){
            
            
            
                
                Image(video.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .cornerRadius(10)
                
            HStack{
                Image("logo")
                        .renderingMode(.original)
                        .resizable()
                    .frame(width: 30, height: 30)
            
                
                VStack(alignment:.leading){
                    
                    Text(video.title)
                        .font(.title)
                        .fontWeight(.bold)
                        
                    HStack{
                        
                        Text("Kavsoft")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        Text(".1.2K Views.5 Days ago")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                   
                    
                    
                }
                
            
            }
            .frame(maxWidth: .infinity,alignment: .leading)
                
                
                
            
        }
        .padding(.horizontal)
        
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

