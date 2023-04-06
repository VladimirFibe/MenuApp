import UIKit
import Kingfisher
enum CellRoundedType {
    case top, bottom, all, notRounded
}

class MainTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    private let productImage = UIImageView(image: UIImage(named: "buffalo")).apply {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 66
    }
    private let titleLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
    }
    
    private let descriptionLabel = UILabel().apply {
        $0.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .secondaryLabel
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 3
    }
    
    private let priceButton = UIButton(type: .system).apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("от 345р", for: .normal)
        $0.tintColor = .menuRedColor
        $0.layer.cornerRadius = 6
        $0.layer.borderColor = UIColor.menuRedColor?.cgColor
        $0.layer.borderWidth = 1
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        contentView.addSubview(productImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceButton)
        layoutViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutViews() {
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImage.widthAnchor.constraint(equalToConstant: 132),
            productImage.heightAnchor.constraint(equalToConstant: 132),
            titleLabel.topAnchor.constraint(equalTo: productImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceButton.bottomAnchor.constraint(equalTo: productImage.bottomAnchor),
            priceButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceButton.widthAnchor.constraint(equalToConstant: 87),
            priceButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func configure(with recipe: Recipe, roundedType: CellRoundedType) {
        let url = URL(string: recipe.image)
        productImage.kf.setImage(with: url)
        titleLabel.text = recipe.title
        print()
    }
}
