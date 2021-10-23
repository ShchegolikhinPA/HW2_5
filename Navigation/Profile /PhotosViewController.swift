
import UIKit

class PhotosViewController: UIViewController {
    
    var photosGalleryCollectionView: UICollectionView = {
        var photosGalleryCollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let photosGalleryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: photosGalleryCollectionViewFlowLayout)
        photosGalleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photosGalleryCollectionView.backgroundColor = .white
        return photosGalleryCollectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos Gallery"
        
        SetupConstraints()
        
        photosGalleryCollectionView.delegate = self
        photosGalleryCollectionView.dataSource = self
        
        photosGalleryCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
    }
    
}

extension PhotosViewController {
    func SetupConstraints() {
        
        view.addSubview(photosGalleryCollectionView)
        
        let constraints = [
            photosGalleryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosGalleryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosGalleryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photosGalleryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollectionView = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        cellCollectionView.photos = collectionPhotos[indexPath.row]
        cellCollectionView.layer.cornerRadius = 6
        return cellCollectionView
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthCell = (collectionView.frame.width - 32) / CGFloat(3)
        let heightCell = widthCell
        
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}

let pVC = PhotosViewController()
let photonNC = UINavigationController(rootViewController: pVC)
