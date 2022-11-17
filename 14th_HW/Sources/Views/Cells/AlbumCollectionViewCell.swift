//
//  AlbumCollectionViewCell.swift
//  14th-HW
//
//  Created by Максим Солобоев on 01.11.2022.
//

import UIKit
import SnapKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AlbumCell"
    
    private var cellData: CollectionModel?
    func fillCell(from instance: CollectionModel) {
        self.cellData = instance
        title.text = cellData?.title
        image.image = cellData?.image
        count.text = cellData?.count
    }
    
    private lazy var title: UILabel = {
        let title = UILabel()
        return title
    }()
    
    private lazy var count: UILabel = {
        let count = UILabel()
        return count
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .systemGray3
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        addSubview(image)
        addSubview(title)
        addSubview(count)
        
    }
    
    func setupLayout() {
        title.snp.makeConstraints { make in
            make.left.equalTo(image.snp.left)
            make.top.equalTo(image.snp.bottom).offset(10)
        }
        
        count.snp.makeConstraints { make in
            make.left.equalTo(image.snp.left)
            make.top.equalTo(title.snp.bottom).offset(5)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.height.equalTo(contentView).offset(-70)
            make.width.equalTo(image.snp.height)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
        }
    }
}
