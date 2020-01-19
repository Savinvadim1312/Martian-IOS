import Foundation
import XCTest

@testable import Martian


class NetworkManagerTests: XCTestCase {
 
    func testFirstRoverName(){
        let apiFirstRoverName: String =  "Curiosity"
        NetworkManager.shared.getRovers(onSucces: { (Rovers) in
            XCTAssertEqual(Rovers.rovers.first?.name , apiFirstRoverName)
        }) { (error) in
            print(error)
        }
    }
    
    func testGetRoversRequestIsComing(){
        NetworkManager.shared.getRovers(onSucces: { (Rovers) in
            XCTAssertNil(Rovers)
        }) { (error) in
            print(error)
        }
    }
    
    func testNumberOfRoversComeFromApi(){
        let numberOfRoversFromAPI = 3
        NetworkManager.shared.getRovers(onSucces: { (Rovers) in
            XCTAssertEqual(Rovers.rovers.count, numberOfRoversFromAPI)
        }) { (error) in
            print(error)
        }
    }
    
    func testGetPhotoFromFirstRoverIsComing(){
        let apiFirstRoverName: String =  "Curiosity"
        NetworkManager.shared.getPhotoFromRover(roverName: apiFirstRoverName, onSucces: { (Photos) in
             XCTAssertNil(Photos)
        }) { (error) in
            print(error)
        }
    }
    
    
}
