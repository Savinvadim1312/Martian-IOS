import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkManager {
    static var shared = NetworkManager()
    
    private let getRoverApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/?sol=1000&api_key=q29TiM228MPJxQHFigklIL63wCZfGe5Xvi3RvgQp"
    private var getPhotosApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=q29TiM228MPJxQHFigklIL63wCZfGe5Xvi3RvgQp"

    
    func getRovers(onSucces: @escaping (Rovers) -> Void, onFail: @escaping (Error) -> Void)
    {
        Alamofire.request(getRoverApi, method: .get).validate().responseObject{
            (response:DataResponse<Rovers>) in
            switch response.result{
            case .success(let value):
                onSucces(value)
            case .failure(let error):
                        onFail(error)
               
            }
        }
    }

    func getPhotoFromRover(roverName: String ,onSucces: @escaping (Photos) -> Void, onFail: @escaping (Error) -> Void)
    {
        switch roverName {
        case "Curiosity":
            getPhotosApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=q29TiM228MPJxQHFigklIL63wCZfGe5Xvi3RvgQp"
        case "Opportunity":
            getPhotosApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&api_key=q29TiM228MPJxQHFigklIL63wCZfGe5Xvi3RvgQp"
        case "Spirit":
            getPhotosApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&api_key=q29TiM228MPJxQHFigklIL63wCZfGe5Xvi3RvgQp"
        default:
            break
        }
        Alamofire.request(getPhotosApi, method: .get).validate().responseObject{
            (response:DataResponse<Photos>) in
            switch response.result{
            case .success(let value):
                onSucces(value)
            case .failure(let error):
                onFail(error)
                
            }
        }
    }
    
}
