//
//  TopTradeView.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 22/08/2023.
//

import UIKit

class TopTradeView: UIView {
    
    lazy private var num: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Inter-Medium", size: 12)
        view.text = "№"
        return view
    }()
    
    lazy private var country: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Inter-Medium", size: 12)
        view.text = "Country"
        return view
    }()
    
    lazy private var name: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Inter-Medium", size: 12)
        view.text = "Name"
        return view
    }()
    
    lazy private var deposit: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Inter-Medium", size: 12)
        view.text = "Deposit"
        return view
    }()
    
    lazy private var profit: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Inter-Medium", size: 12)
        view.text = "Profit"
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .topTradeView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(num)
        num.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-13)
        }
        
        addSubview(country)
        country.snp.makeConstraints {
            $0.left.equalTo(num.snp.right).offset(15)
            $0.bottom.equalToSuperview().offset(-13)
        }
        
        addSubview(name)
        name.snp.makeConstraints {
            $0.left.equalTo(country.snp.right).offset(40)
            $0.bottom.equalToSuperview().offset(-13)
        }
        
        addSubview(deposit)
        deposit.snp.makeConstraints {
            $0.left.equalTo(name.snp.right).offset(60)
            $0.bottom.equalToSuperview().offset(-13)
        }
        
        addSubview(profit)
        profit.snp.makeConstraints {
            
            $0.bottom.equalToSuperview().offset(-13)
            $0.right.equalToSuperview().offset(-9)
        }
        
    }
    
}
