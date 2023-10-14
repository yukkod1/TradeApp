//
//  PairCollectionViewCell.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 21/09/2023.
//

import UIKit

class PairCollectionViewCell: UICollectionViewCell {
    static let id = "PairCollectionVIewCell"
    
    weak var delegate: PairDelegate?
    
    lazy var invisibleButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        return view
    }()
    
    var choosen = false {
        didSet {//                              true          false
            self.backgroundColor = choosen ? .lightGreen : .lightGray2
        }
    }
    lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray2
        layer.cornerRadius = 10
        layer.masksToBounds = true
        setupMainLabel()
        setupInvisibleButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInvisibleButton() {
        self.addSubview(invisibleButton)
        invisibleButton.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    func setupMainLabel() {
        self.addSubview(mainLabel)
        mainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc func buttonDidTapped() {
        if choosen {
            choosen = false
        } else {
            choosen = true
        }
        
        if let delegate = delegate, let pair = mainLabel.text {
            delegate.pairDidSelect(pair)
        }
    }
}

protocol PairDelegate: AnyObject {
    func pairDidSelect(_ pair: String)
    
}
