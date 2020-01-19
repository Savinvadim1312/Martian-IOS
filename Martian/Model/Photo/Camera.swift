import Foundation
import ObjectMapper

class Camera: Mappable
{
    var name: String?
    var full_name: String?
 
    required convenience init?(map: Map) {
           self.init()
       }
       
    func mapping(map: Map) {
        name <- map["name"]
        full_name <- map["full_name"]
    }
}
