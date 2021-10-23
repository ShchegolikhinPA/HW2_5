

import UIKit

class PhotosTableViewCell: UITableViewCell {

    let photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.textColor = .black
        photosLabel.text = "Photos"
        return photosLabel
    }()
    
    var buttonLabel: UIImageView = {
        var buttonLabel = UIImageView()
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.image = UIImage(systemName: "arrow.right")
//        buttonLabel.image = UIImage(named: "arrow.right")
        return buttonLabel
    }()

    private lazy var photosCollectionView: UICollectionView = {
        var photosCollectionViewLayout = UICollectionViewFlowLayout()
        photosCollectionViewLayout.scrollDirection = .horizontal
        
        var photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: photosCollectionViewLayout)
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photosCollectionView.backgroundColor = .white
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))

        return photosCollectionView
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupPhotosTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

extension PhotosTableViewCell {
    
    func setupPhotosTableViewCell() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(buttonLabel)
        contentView.addSubview(photosCollectionView)
        
        let constraints = [
            
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            buttonLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            button.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            buttonLabel.heightAnchor.constraint(equalTo: photosLabel.heightAnchor),
            buttonLabel.widthAnchor.constraint(equalTo: buttonLabel.heightAnchor),
            
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosCollectionView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
//    @objc func tap2(){
//        let photosVC = PhotosViewController()
//    }
}

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPhotos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollectionView = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        
        cellCollectionView.layer.cornerRadius = 6
        cellCollectionView.clipsToBounds = true
        
        cellCollectionView.photos = collectionPhotos[indexPath.row]
        return cellCollectionView
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthCell = (collectionView.frame.width - 44) / CGFloat(4)
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
        UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    
    
}


