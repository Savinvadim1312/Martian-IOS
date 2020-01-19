import UIKit


protocol RoverCollectionViewCellDelegate: class
{
    func viewPhotoPressed(cell: RoverCollectionViewCell)
}


class RoverCollectionViewCell: UICollectionViewCell, ReusableCell, NibLoadableView {

    weak var delegate: RoverCollectionViewCellDelegate?
    static let identifier = "RoverCollectionViewCell"
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var roverNameLbl: UILabel!
    @IBOutlet weak var roverStatusLbl: UILabel!
    @IBOutlet weak var launchDateLbl: UILabel!
    @IBOutlet weak var landingDateLbl: UILabel!
    @IBOutlet weak var maxDateLbl: UILabel!
    @IBOutlet weak var buttonLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func viewPhotoTapped(_ sender: UIButton) {
        delegate?.viewPhotoPressed(cell: self)
    }
    
    func setUpCell(rover: Rover, image: UIImage)
    {
        coverImage.image = image
        roverNameLbl.text = rover.name
        roverStatusLbl.text = rover.status
        launchDateLbl.text = "Launch date :  \(rover.launch_date!)"
        landingDateLbl.text = "Landing date :  \(rover.landing_date!)"
        maxDateLbl.text = "Max date :  \(rover.max_date!)"
        buttonLbl.text = "VIEW PHOTOS (\(rover.total_photos!))"
    }
 
}
