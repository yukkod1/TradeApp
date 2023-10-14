//
//  TableViewCell.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 13/08/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let id = "tableViewCell"
    
    lazy var numberLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Inter-SemiBold", size: 14)
        view.textAlignment = .justified
        return view
    }()
    
    lazy var flags: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Inter-SemiBold", size: 14)
        view.textColor = .white
        view.textAlignment = .justified
        return view
    }()
    
    lazy var depositLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Inter-SemiBold", size: 14)
        view.textColor = .white
        view.textAlignment = .justified
        return view
    }()
    
    lazy var profitLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Inter-SemiBold", size: 14)
        view.textColor = .lightGreen
        view.textAlignment = .left
        return view
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableViewComponents()
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewComponents() {
     
        self.addSubview(numberLabel)
        numberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-14)
        }
        self.addSubview(flags)
        flags.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.left.equalTo(self.numberLabel.snp.left).offset(30)
            $0.bottom.equalToSuperview().offset(-14)
            $0.height.equalTo(26)
            $0.width.equalTo(26)
        }
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.left.equalTo(self.flags.snp.left).offset(75)
            $0.bottom.equalToSuperview().offset(-14)
          
        }
        self.addSubview(depositLabel)
        depositLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.left.equalTo(self.nameLabel.snp.left).offset(105)
            $0.bottom.equalToSuperview().offset(-14)
           
        }
        
        self.addSubview(profitLabel)
        profitLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.right.equalToSuperview().offset(-9)
            $0.bottom.equalToSuperview().offset(-14)
          
        }
   
    }
    
}
