import UIKit
import Kingfisher

class PhotoFromSelectedRoverCollectionViewCell: UICollectionViewCell, ReusableCell, NibLoadableView  {

    static let identifier = "PhotoFromSelectedRoverCollectionViewCell"
    
    @IBOutlet weak var photoFromRover: UIImageView!
    @IBOutlet weak var cameraNameLbl: UILabel!
    @IBOutlet weak var earthDateLbl: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadingIndicator.startAnimating()
    }

    
    func setUpCell(photo: Photo)
    {
        setImage(imageUrl: photo.img_src!)
        cameraNameLbl.text = photo.camera?.name
        earthDateLbl.text = photo.earth_date
    }
    
    private func setImage(imageUrl: String)
    {
        if let imageUrl = URL(string: imageUrl){
            let resource = ImageResource(downloadURL: imageUrl, cacheKey: imageUrl.absoluteString)
            let options = photoFromRover.kingfisherOptions
            photoFromRover.kf.setImage(with: resource, options: options)
        }
    }
}
