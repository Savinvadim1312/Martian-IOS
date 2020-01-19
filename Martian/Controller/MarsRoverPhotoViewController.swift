import UIKit

class MarsRoverPhotoViewController: UIViewController {

    @IBOutlet weak var selectRoverCollectionView: UICollectionView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var rovers: Rovers?
    let roversImages: [UIImage] = [UIImage(named: "firstRover")!, UIImage(named: "secondRover")!, UIImage(named: "thirdRover")!]
    var photos: Photos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        startReuestForRovers()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        selectRoverCollectionView.reloadData()
    }
    
    private func startReuestForRovers()
    {
        loadingView.isHidden = false
        NetworkManager.shared.getRovers(onSucces: { [weak self] (rovers) in
            self?.loadingView.isHidden = true
            self?.rovers = rovers
            self?.registerCells()
            self?.selectRoverCollectionView.delegate = self
            self?.selectRoverCollectionView.dataSource = self
        }) { (error) in
            print(error)
        }
    }
    
    
    private func registerCells()
    {
        selectRoverCollectionView.register(RoverCollectionViewCell.self)
    }
}

//MARK: Extensions

extension MarsRoverPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numbOfRovers = rovers?.rovers.count else
        {
            return 1
        }
        return numbOfRovers
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        if self.isPortrait {
            return CGSize(width: collectionViewFrame.width - 40 , height: collectionViewFrame.height - 20)
        } else {
            return CGSize(width: collectionViewFrame.width / 3 , height: collectionViewFrame.height - 30)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoverCollectionViewCell.identifier, for: indexPath) as! RoverCollectionViewCell
        guard let rover = rovers?.rovers[indexPath.item] else
        {
            return cell
        }
        
        cell.setUpCell(rover: rover, image: roversImages[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    
}


extension MarsRoverPhotoViewController: RoverCollectionViewCellDelegate
{
    func viewPhotoPressed(cell: RoverCollectionViewCell) {
        loadingView.isHidden = false
        guard let roverName = cell.roverNameLbl.text else
        {
            return
        }
        NetworkManager.shared.getPhotoFromRover(roverName: roverName, onSucces: { [weak self] (photos) in
            DispatchQueue.main.async {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotosFromSelectedRoverViewController") as! PhotosFromSelectedRoverViewController
                vc.photos = photos
                self?.loadingView.isHidden = true
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            
        }) { (error) in
            print(error)
        }
        
    }
}
