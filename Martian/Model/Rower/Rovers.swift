import Foundation
import ObjectMapper

class Rovers: Mappable {
    var rovers: [Rover] = []
    
    required convenience init?(map: Map) {
              self.init()
          }
          
       func mapping(map: Map) {
           rovers <- map["rovers"]
       }
}
