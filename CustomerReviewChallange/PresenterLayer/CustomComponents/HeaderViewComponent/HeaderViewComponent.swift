//
//  HeaderViewComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 12.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class HeaderViewComponent: BaseView {
    
    private weak var delegate: HeaderViewComponentDelegate?
    
    private var genericDataCompletionHandler: GenericDataProtocolCompletion?
    
    public var filterView: FilterCollectionView!
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        temp.delegate = self
        temp.dataSource = self
        
        return temp
    }()
    
    init(frame: CGRect, delegate: HeaderViewComponentDelegate?) {
        self.delegate = delegate
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        addFilterCollectionView()
        addCollectionView()
        
    }
    
    private func addFilterCollectionView() {
        filterView = FilterCollectionView()
        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(filterView)
        
        NSLayoutConstraint.activate([
        
            filterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterView.topAnchor.constraint(equalTo: topAnchor),
            filterView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
        ])
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        registerCells()
        
    }
    
    private func registerCells() {
        collectionView.genericRegisterCell(FrequentLabelCollectionViewCell.self)
    }
    
    private func bindRowSelection(data: GenericCellTypeProtocol) {
        userInteractionManager(active: true)
        genericDataCompletionHandler?(data)
    }
    
    private func userInteractionManager(active: Bool) {
        isUserInteractionEnabled = active
    }
    
    func listenSelectedData(completion: @escaping GenericDataProtocolCompletion) {
        genericDataCompletionHandler = completion
    }
    
    func reloadHeader(animated: Bool = true) {
        if animated {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
                self?.collectionView.reloadData()
            })
        } else {
            collectionView.reloadData()
        }
    }
    
}

// Mark: TableView Delegate, Datasources
extension HeaderViewComponent: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getNumberOfHeaderItem() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = delegate?.getHeaderItem(index: indexPath.row) else { fatalError() }
        
        switch data.returnViewType() {
        case .info:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FrequentLabelCollectionViewCell.identifier, for: indexPath) as? FrequentLabelCollectionViewCell else { fatalError() }
            cell.setData(data: data)
            return cell
        }
    }
    
    
}
