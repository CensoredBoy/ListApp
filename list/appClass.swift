import UIKit

import SwiftUI

struct appClass:Identifiable, Codable
{
    
    var id = UUID()
    let name: String?
    let description: String?
    let link: String?
    let icon_url: String?
    
    func get_link()->String{
        var link_app : String = self.link!
        link_app = link_app.substring(from: link_app.index(link_app.startIndex, offsetBy: 8))
        link_app = link_app.substring(to: link_app.lastIndex(of: ".")!)
        link_app+="://"
        if UIApplication.shared.canOpenURL( URL( string: link_app)!)
        {
             return link_app
        }
        else{
            return self.link!
        }
    
    
    }
}

