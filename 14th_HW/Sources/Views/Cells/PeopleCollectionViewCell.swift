//
//  PeopleCollectionViewCell.swift
//  14th_HW
//
//  Created by Максим Солобоев on 17.11.2022.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PeopleCell"
    private var cellData: CollectionModel?
    
    func fillCell(from instance: CollectionModel) {
        self.cellData = instance
        image.image = cellData?.image
    }
    
    // MARK: - Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray3
        setupHierarchy()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        contentView.addSubview(image)
    }
    
    private func setupView() {
        image.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
    }
    
    func configuration(with instance: CollectionModel) {
        
    }
}
