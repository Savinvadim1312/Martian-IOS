import UIKit
import Kingfisher

class DetailedPhotoViewController: UIViewController {

    @IBOutlet weak var imageFromRover: UIImageView!
    @IBOutlet weak var cameraNameLbl: UILabel!
    @IBOutlet weak var earthDateLbl: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var photoWithDescription: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        setUp(photo: photoWithDescription!)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.layoutIfNeeded()
    }
    
    private func setUp(photo: Photo)
    {
        setImage(imageUrl: photo.img_src!)
        cameraNameLbl.text = photo.camera?.name
        earthDateLbl.text = photo.earth_date
    }
    
    private func setImage(imageUrl: String)
       {
           if let imageUrl = URL(string: imageUrl){
               let resource = ImageResource(downloadURL: imageUrl, cacheKey: imageUrl.absoluteString)
               let options = imageFromRover.kingfisherOptions
               imageFromRover.kf.setImage(with: resource, options: options)
           }
       }


}
