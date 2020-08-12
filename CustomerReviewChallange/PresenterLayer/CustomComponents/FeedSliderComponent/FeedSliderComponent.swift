//
//  FeedSliderComponent.swift
//  CustomerReviewChallange
//
//  Created by Erkut Bas on 11.08.2020.
//  Copyright © 2020 Erkut Bas. All rights reserved.
//

import UIKit

class FeedSliderComponent: BaseView {
    
    private weak var delegate: FeedSliderComponentDelegate?
    
    private var genericDataCompletionHandler: GenericDataProtocolCompletion?

    lazy var tableView: UITableView = {
        let temp = UITableView(frame: .zero, style: .plain)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.separatorStyle = .none
        
        temp.rowHeight = UITableView.automaticDimension
        temp.estimatedRowHeight = 500
        
        temp.delegate = self
        temp.dataSource = self
        
        return temp
    }()
    
    init(frame: CGRect, delegate: FeedSliderComponentDelegate?) {
        self.delegate = delegate
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        addTableView()
    }
    
    override func setupViews() {
        super.setupViews()
        registerCells()
    }
    
    private func addTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    private func registerCells() {
        tableView.genericRegister(FeedComponentCell.self)
    }
    
    private func bindRowSelection(data: GenericDataProtocol) {
        userInteractionManager(active: true)
        genericDataCompletionHandler?(data)
    }
    
    private func userInteractionManager(active: Bool) {
        isUserInteractionEnabled = active
    }
    
    func listenSelectedData(completion: @escaping GenericDataProtocolCompletion) {
        genericDataCompletionHandler = completion
    }
    
    func reloadFeedSlider(animated: Bool = true) {
        if animated {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
                self?.tableView.reloadData()
            })
        } else {
            tableView.reloadData()
        }
    }
    
}

// Mark: TableView Delegate, Datasources
extension FeedSliderComponent: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getNumberOfItem() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = delegate?.getItem(index: indexPath.row) else { fatalError() }
        
        let cell: FeedComponentCell = tableView.genericDequeCell(indexPath: indexPath)
        
        cell.setRowData(data: data)
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FeedComponentCell else { return }
        userInteractionManager(active: false)
        cell.subscribeToSelectedRow(completion: bindRowSelection(data:))
    }
    
}
