//
//  ActivityViewController.swift
//  TradeApp
//
//  Created by Artem Cherkasov on 13/08/2023.
//

import UIKit

class ActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
            
    var response: [Model] = [
        Model(urlToImage: "united-states", num: "1", nameOfPerson: "Oliver", deposit: "$2367", profit: "$336755"),
        Model(urlToImage: "canada", num: "2", nameOfPerson: "Jack", deposit: "$1175", profit: "$148389"),
        Model(urlToImage: "brazil", num: "3", nameOfPerson: "Harry", deposit: "$1000", profit: "$113888"),
        Model(urlToImage: "south-korea", num: "4", nameOfPerson: "Jacob", deposit: "$999", profit: "$36755"),
        Model(urlToImage: "germany", num: "5", nameOfPerson: "Charley", deposit: "$888", profit: "$18389"),
        Model(urlToImage: "brazil", num: "6", nameOfPerson: "Thomas", deposit: "$777", profit: "$12000"),
        Model(urlToImage: "france", num: "7", nameOfPerson: "George", deposit: "$666", profit: "$11111"),
        Model(urlToImage: "new-zealand", num: "8", nameOfPerson: "Oscar", deposit: "$555", profit: "$9988"),
        Model(urlToImage: "india", num: "9", nameOfPerson: "James", deposit: "$444", profit: "$8877"),
        Model(urlToImage: "spain", num: "10", nameOfPerson: "William", deposit: "$333", profit: "$6652")
    ]
    
    lazy private var tableView: UITableView = {
        let view = UITableView()
        view.layer.cornerRadius = 9
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .darkBlue
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return view
    }()
    
    lazy private var numberLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.textColor = .white
        return view
    }()
    
    lazy private var flags: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "flag")
        return view
    }()
    
    lazy private var countryNameLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.textColor = .white
        return view
    }()
    
    lazy private var deposit: UILabel = {
        let view = UILabel()
        view.text = ""
        view.textColor = .white
        return view
    }()
    
    lazy private var profit: UILabel = {
        let view = UILabel()
        view.text = ""
        view.textColor = .white
        return view
    }()
    
    lazy private var topTradeView: TopTradeView = {
        let view = TopTradeView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 9
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TOP 10 Traders"
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Inter-SemiBold", size: 22)!
        ]
        
        view.backgroundColor = .normalGray
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        setupTopTradeView()
        setupTableView()
        

        
    }
    
    func setupTableView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(topTradeView.snp.bottom)
            $0.right.equalToSuperview().offset(-12)
            $0.left.equalToSuperview().offset(12)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-45)
            
        }
    }
    
    func setupTopTradeView() {
        self.view.addSubview(topTradeView)
        topTradeView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(29)
            $0.left.equalToSuperview().offset(12)
            $0.right.equalToSuperview().offset(-12)
            $0.height.equalTo(50)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell {
            
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .topTradeView
            } else {
                cell.backgroundColor = .darkBlue
            }
            
            let item = response[indexPath.row]
            cell.numberLabel.text = item.num
            cell.depositLabel.text = item.deposit
            cell.profitLabel.text = item.profit
            cell.nameLabel.text = item.nameOfPerson
            cell.flags.image = UIImage(named: item.urlToImage)
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    
}
