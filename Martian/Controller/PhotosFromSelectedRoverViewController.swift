import UIKit

class PhotosFromSelectedRoverViewController: UIViewController {

    @IBOutlet weak var takenPhotoCollectionView: UICollectionView!
    
    var photos: Photos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIDevice.current.orientation)
        registerCells()
        takenPhotoCollectionView.delegate = self
        takenPhotoCollectionView.dataSource = self
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        takenPhotoCollectionView.reloadData()
    }
    
    private func registerCells()
    {
        takenPhotoCollectionView.register(PhotoFromSelectedRoverCollectionViewCell.self)
    }

}

//MARK: Extensions

extension PhotosFromSelectedRoverViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numbOfRovers = photos?.photos.count else
        {
            return 1
        }
        return numbOfRovers
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        if self.isPortrait {
            return CGSize(width: collectionViewFrame.width / 2.2 , height: collectionViewFrame.width / 2.2 + 40)
        } else {
            return CGSize(width: collectionViewFrame.width / 3 - 20 , height: collectionViewFrame.width / 3)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoFromSelectedRoverCollectionViewCell.identifier, for: indexPath) as! PhotoFromSelectedRoverCollectionViewCell
        guard let photo = photos?.photos[indexPath.item] else
        {
            return cell
        }
        cell.setUpCell(photo: photo)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {  
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailedPhotoViewController") as! DetailedPhotoViewController
        guard let photo = photos?.photos[indexPath.item] else
        {
            return
        }
        vc.photoWithDescription = photo
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
