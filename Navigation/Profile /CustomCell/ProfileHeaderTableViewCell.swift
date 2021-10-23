
import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    
    var contentPosts: Post? {
        didSet {
            titleContaintLabel.text = contentPosts?.author
            contentImageView.image = UIImage(named: contentPosts?.image ?? "")
                textContaintLabel.text = contentPosts?.description
            lickesContaintLabel.text = "Likes: \(String(describing: contentPosts!.likes))"
            viewsContaintLabel.text = "Views: \(String(describing: contentPosts!.views))"
        }
    }
        
    var titleContaintLabel: UILabel = {
        let containtLabel = UILabel()
        containtLabel.translatesAutoresizingMaskIntoConstraints = false
        containtLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        containtLabel.textColor = .black
        containtLabel.numberOfLines = 2
        return containtLabel
    }()
    
    var contentImageView: UIImageView = {
        let contentImageView = UIImageView()
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.contentMode = .scaleAspectFit
        contentImageView.backgroundColor = .black
        return contentImageView
    }()

    var textContaintLabel: UILabel = {
        let containtLabel = UILabel()
        containtLabel.translatesAutoresizingMaskIntoConstraints = false
        containtLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        containtLabel.textColor = .systemGray
        containtLabel.numberOfLines = 0
        return containtLabel
    }()

    var lickesContaintLabel: UILabel = {
        let lickesContaintLabel = UILabel()
        lickesContaintLabel.translatesAutoresizingMaskIntoConstraints = false
        lickesContaintLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lickesContaintLabel.textColor = .black
        lickesContaintLabel.numberOfLines = 1
        return lickesContaintLabel
    }()

    var viewsContaintLabel: UILabel = {
        let viewsContaintLabel = UILabel()
        viewsContaintLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsContaintLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsContaintLabel.textColor = .black
        viewsContaintLabel.numberOfLines = 1
        viewsContaintLabel.textAlignment = NSTextAlignment.right
        return viewsContaintLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension ProfileHeaderTableViewCell {
     
    private func setupView() {
        
        contentView.addSubview(titleContaintLabel)
        contentView.addSubview(contentImageView)
        contentView.addSubview(textContaintLabel)
        contentView.addSubview(lickesContaintLabel)
        contentView.addSubview(viewsContaintLabel)
        
        let constraints = [
            
            titleContaintLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleContaintLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleContaintLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            contentImageView.topAnchor.constraint(equalTo: titleContaintLabel.bottomAnchor, constant: 16),
            contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentImageView.heightAnchor.constraint(equalTo: contentImageView.widthAnchor),

            textContaintLabel.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 16),
            textContaintLabel.leadingAnchor.constraint(equalTo: titleContaintLabel.leadingAnchor),
            textContaintLabel.trailingAnchor.constraint(equalTo: titleContaintLabel.trailingAnchor),

            lickesContaintLabel.topAnchor.constraint(equalTo: textContaintLabel.bottomAnchor, constant: 16),
            lickesContaintLabel.leadingAnchor.constraint(equalTo: titleContaintLabel.leadingAnchor),
            lickesContaintLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            lickesContaintLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            viewsContaintLabel.topAnchor.constraint(equalTo: lickesContaintLabel.topAnchor),
            viewsContaintLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            viewsContaintLabel.trailingAnchor.constraint(equalTo: titleContaintLabel.trailingAnchor),
            viewsContaintLabel.bottomAnchor.constraint(equalTo: lickesContaintLabel.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
