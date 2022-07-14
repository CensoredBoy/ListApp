//
//  ContentView.swift
//  VKDev
//
//  Created by Nick Yar on 14.07.2022.
//

import SwiftUI


struct ContentView: View {

var apps: [appClass]? = parser()

var body: some View
{
    NavigationView
    {
            
        List(apps ?? [])
        {
                
            app in appCell(app: app)
            
        }
        .navigationBarTitle(Text("Сервисы VK"))
    }
}

}

struct appCell: View
{
var app: appClass

var body: some View
{
    
    
    
    Link(destination: URL(string: app.get_link())!)
    {
        HStack{
            AsyncImage(url: URL(string: app.icon_url!))
            { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }                .aspectRatio(contentMode: .fill)
            .frame(width:50,height: 50)
            .scaledToFill()
            .cornerRadius(15)
            .padding([.leading, .trailing], 5)
        
            
        VStack(alignment: .leading, spacing: 3)
        {
            
            Text(app.name!).foregroundColor(.primary)
            Text(app.description!)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(3)
        }
            
            Text(">").foregroundColor(.gray)
        }
    }
}
}


struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
