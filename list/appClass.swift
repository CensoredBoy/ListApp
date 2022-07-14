import UIKit

import SwiftUI

struct appClass:Identifiable, Codable
{
    
    var id = UUID()
    let name: String?
    let description: String?
    let link: String?
    let icon_url: String?
    
    
}
struct AppDataDetail : View {
    var name: String
    var description: String
    var link: String
    var icon_url: String
    
    var body: some View {
        VStack {
            Image(icon_url)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.orange, lineWidth: 4)
                )
                .shadow(radius: 10)
            Text(name)
                .font(.title)
            Text(description)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(50)
            }.padding().navigationBarTitle(Text(name), displayMode: .inline)
    }
}
