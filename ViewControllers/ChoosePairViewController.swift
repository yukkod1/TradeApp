//
//  ChoosePairViewController.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 21/09/2023.
//

import UIKit

protocol PairDidChoose: AnyObject {
    func pairDidChoose(pair: String)
    
}
class ChoosePairViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PairDelegate {
    
    func pairDidSelect(_ pair: String) {
        self.choosenPair = pair
        
        if let delegate = delegate, let pair = self.choosenPair {
            delegate.pairDidChoose(pair: pair)
        }
    }
    
    weak var delegate: PairDidChoose?
    var choosenPair: String?
    
    let response: [PairModel] = [
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "GPB / USD"),
        PairModel(gpbLabel: "USD / CAD"),
        PairModel(gpbLabel: "GBR / CHF"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD"),
        PairModel(gpbLabel: "EUR / USD")
    ]
        
    

    lazy var pairCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray2
        title = "Currency Pair"
        pairCollectionView.register(PairCollectionViewCell.self, forCellWithReuseIdentifier: PairCollectionViewCell.id)
        pairCollectionView.delegate = self
        pairCollectionView.dataSource = self
        
        
        setupCollectionView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return response.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PairCollectionViewCell.id, for: indexPath) as? PairCollectionViewCell {
            cell.delegate = self
            let item = response[indexPath.row]
            cell.mainLabel.text = item.gpbLabel
            return cell
        }
        return UICollectionViewCell()
    }
    
    func setupCollectionView() {
        view.addSubview(pairCollectionView)
        pairCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.left.equalToSuperview().offset(37)
            $0.right.equalToSuperview().offset(-37)
            $0.bottom.equalToSuperview().offset(-91)
        }
    }
    
 
    
    
}

extension ChoosePairViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat(140), height: CGFloat(54))
    }
    
}
