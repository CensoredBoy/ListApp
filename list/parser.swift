//
//  parser.swift
//  list
//
//  Created by mac on 14.07.2022.
//

import Foundation

func parser() -> [appClass]{
    
    if let path = Bundle.main.path(forResource: "data", ofType: "json") {
        do {
              let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
              let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
              if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let services = jsonResult["body"] as? Dictionary<String, AnyObject>  {
                  let services_arr = services["services"] as! [AnyObject]

                  var res :[appClass] = []
                  for elem in services_arr{
                      res.append(appClass(
                        name: elem["name"] as? String,
                        description: elem["description"] as? String,
                        link:elem["link"] as? String,
                        icon_url: elem["icon_url"] as? String
                        
                            
                      ))
                  }

                  return res
                        // do stuff
              }
          } catch {
               // handle error
          }
    }

return []
}

