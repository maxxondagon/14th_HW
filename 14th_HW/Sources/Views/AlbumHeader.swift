//
//  AlbumHeader.swift
//  14th-HW
//
//  Created by Максим Солобоев on 01.11.2022.
//

import UIKit

class AlbumHeader: UICollectionReusableView {
    
    static let identifier = "AlbumCellHeader"
    
    // MARK: - Outlets
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return title
    }()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray3
        return separator
    }()
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        addSubview(title)
        addSubview(separator)
    }
    
    func setupLayout() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
        }
        separator.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(0.5)
            make.width.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
