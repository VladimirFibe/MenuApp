import UIKit

final class BannersView: UIView {
    private enum MainSection: Int {
        case main
    }

    private typealias DataSource = UICollectionViewDiffableDataSource<MainSection, String>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<MainSection, String>
    
    private var banners: [String] = ["banner3", "banner4", "banner5"]
    private var dataSource: DataSource!
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.register(BannersCell.self, forCellWithReuseIdentifier: BannersCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        collectionView.backgroundColor = .menuBackgroundColor
        configureDataSource()
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(banners, toSection: .main)
        print(banners)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout =  UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(300), heightDimension: .absolute(112))
            
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            layoutItem.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(10), top: .fixed(1), trailing: .fixed(10), bottom: .fixed(1))
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .fractionalWidth(1))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
            
            layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            
            return layoutSection
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        layout.configuration = config
        return layout
    }
    
    private func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannersCell.identifier, for: indexPath) as? BannersCell
            else { fatalError("Unable to dequeue \(BannersCell.identifier)")}
            let name = self.banners[indexPath.row]
            cell.configure(with: name)
            return cell
        }
    }
}
