import Foundation
import ObjectMapper

class Photo: Mappable
{
    var img_src: String?
    var earth_date: String?
    var camera: Camera?
    
    required convenience init?(map: Map) {
           self.init()
       }
       
    func mapping(map: Map) {
        img_src <- map["img_src"]
        earth_date <- map["earth_date"]
        camera <- map["camera"]
    }
}
