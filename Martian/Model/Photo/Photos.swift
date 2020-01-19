import Foundation
import ObjectMapper

class Photos: Mappable {
    var photos: [Photo] = []
    
    required convenience init?(map: Map) {
              self.init()
          }
          
       func mapping(map: Map) {
           photos <- map["photos"]
       }
}
