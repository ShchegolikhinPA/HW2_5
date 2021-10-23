
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    var photos: Photos? {
        didSet {
            photosImage.image = UIImage(named: photos?.photosImage ?? "")
        }
    }

    let photosImage: UIImageView = {
        let photosImage = UIImageView()
        photosImage.translatesAutoresizingMaskIntoConstraints = false
        photosImage.sizeToFit()
        return photosImage
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotosImage()
    }
    
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
}

extension PhotosCollectionViewCell {
    func  setupPhotosImage() {
        contentView.addSubview(photosImage)
        
        let constraints = [
            photosImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosImage.heightAnchor.constraint(equalTo: photosImage.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
