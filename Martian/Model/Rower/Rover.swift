import Foundation
import ObjectMapper

class Rover: Mappable {
    var name: String?
    var status: String?
    var landing_date: String?
    var launch_date: String?
    var max_date: String?
    var total_photos: Int?
    
    required convenience init?(map: Map) {
           self.init()
       }
       
    func mapping(map: Map) {
        name <- map["name"]
        status <- map["status"]
        landing_date <- map["landing_date"]
        launch_date <- map["launch_date"]
        max_date <- map["max_date"]
        total_photos <- map["total_photos"]
    }
}


