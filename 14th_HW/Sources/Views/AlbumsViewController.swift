import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    private var itemData = CollectionModel.getInstances()
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collecion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collecion.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        collecion.delegate = self
        collecion.dataSource = self
        return collecion
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    func setupView() {
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
    
    // MARK: - Layout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
                
                // Albums
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(225), heightDimension: .absolute(450))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 10,
                                                                    bottom: 0,
                                                                    trailing: 10)
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .paging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(60)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 10,
                                                                bottom: 0,
                                                                trailing: 0)
                return sectionLayout
                
                // People
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(400), heightDimension: .absolute(200))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .groupPagingCentered
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(80)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 15,
                                                                bottom: 5,
                                                                trailing: 0)
                return sectionLayout
   
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(400))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .paging
                return sectionLayout
            }
        }
    }
}

// MARK: - DataSource extension

extension AlbumsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemData[section].count
        //        switch section {
        //        case 0:
        //            return count
        //        case 1:
        //            return count
        //        case 2:
        //            return count
        //        case 3:
        //            return count
        //        default:
        //            return 0
        //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let albumCell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as? AlbumCollectionViewCell
            albumCell?.fillCell(from: itemData[indexPath.section][indexPath.row])
            return albumCell ?? UICollectionViewCell()
        case 1:
            let peopleCell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.identifier, for: indexPath) as? PeopleCollectionViewCell
            peopleCell?.fillCell(from: itemData[indexPath.section][indexPath.row])
            return peopleCell ?? UICollectionViewCell()
        case 2:
            let mediaCell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypeCollectionViewCell.identifier, for: indexPath) as? MediaTypeCollectionViewCell
            mediaCell?.fillCell(from: itemData[indexPath.section][indexPath.row])
            return mediaCell ?? UICollectionViewCell()
        case 3:
            let utilityCell = collectionView.dequeueReusableCell(withReuseIdentifier: UtilityCollectionViewCell.identifier, for: indexPath) as? UtilityCollectionViewCell
            utilityCell?.fillCell(from: itemData[indexPath.section][indexPath.row])
            return utilityCell ?? UICollectionViewCell()
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath)
            cell.backgroundColor = .gray
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumHeader.identifier, for: indexPath) as? AlbumHeader
            header?.title.text = "My Albums"
            return header ?? UICollectionReusableView()
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumHeader.identifier, for: indexPath) as? AlbumHeader
            header?.title.text = "People"
            return header ?? UICollectionReusableView()
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            return header
        }
    }
}

// MARK: - Delegate extension

extension AlbumsViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        itemData.count
    }
}
